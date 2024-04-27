// ignore_for_file: body_might_complete_normally_nullable, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gapopa_flutter_app/api/api_repo.dart';
import 'package:gapopa_flutter_app/models/image_model.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';

final api = ApiRepo.instance;

class HomeViewModel extends BaseViewModel {
  // List<Hits> tempImages = [];
  var page = 1;
  var clength = 0;
  var perPage = 28;

  PagingController<int, Hits> pagingController = PagingController(firstPageKey: 1);

  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  HomeViewModel() {
    // loadItems();
  }
  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);

    setBusy(false);
    notifyListeners();
  }

  void fetchPage({bool refresh = false}) async {
    if (refresh) {
      setBusy(true);
      page = 1;
      pagingController.refresh();
      pagingController = PagingController(firstPageKey: 1);
      await Future.delayed(const Duration(seconds: 1));
      setBusy(false);
      notifyListeners();
    }
    try {
      String query = '&image_type=photo&page=$page&per_page=$perPage';
      if (searchController.text.isNotEmpty) query = '&q=${searchController.text}' + query;
      final res = await api.getImages(query);
      if (res.success!) {
        page++;
        notifyListeners();
        pagingController.appendPage(res.data!.hits!, page);
      } else {
        pagingController.appendLastPage([]);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void onSearchChangeses(String value) async {
    if (value.isEmpty) {
      fetchPage(refresh: true);
    } else {
      newMethod(value);
    }
  }

  newMethod(String value) async {
    if (clength == 0 && value.isNotEmpty) {
      page = 1;
      notifyListeners();
      pagingController.refresh();
      pagingController.appendPage([], 1);
    }
    try {
      setBusy(true);

      await Future.delayed(const Duration(seconds: 1));
      final res = await api.getImages('&q=$value&image_type=photo&page=$page&per_page=$perPage');
      print('&q=$value&image_type=photo&page=$page&per_page=$perPage');
      setBusy(false);
      if (res.success!) {
        pagingController.refresh();
        pagingController.appendPage(res.data!.hits!, 0);
      } else {
        pagingController.appendLastPage([]);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void onSearchTap() {
    page = 1;
    pagingController = PagingController(firstPageKey: 1);
    notifyListeners();
  }

  void changeDarkMode() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  Widget? buildCounter(BuildContext context, {required int currentLength, required bool isFocused, required int? maxLength}) {
    clength = currentLength;
    notifyListeners();
  }
}
