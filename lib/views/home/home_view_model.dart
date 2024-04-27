// ignore_for_file: body_might_complete_normally_nullable

import 'dart:developer';

import 'package:flutter/material.dart';
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
  var perPage = 30;

  PagingController<int, Hits> pagingController = PagingController(firstPageKey: 0);

  HomeViewModel() {
    loadItems();
  }
  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    //Write your models loading codes here
    pagingController.addPageRequestListener((pageKey) {
      fetchPage();
    });
    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  void fetchPage({bool refresh = false}) async {
    if (refresh) {
      setBusy(true);
      page = 1;
      pagingController = PagingController(firstPageKey: 1);
      await Future.delayed(const Duration(seconds: 1));
      setBusy(false);
      notifyListeners();
    }
    try {
      final res = await api.getImages('&image_type=photo&page=$page&per_page=$perPage');
      if (res.success!) {
        page++;
        pagingController.appendPage(res.data!.hits!, page);
        notifyListeners();
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
    log(clength.toString());
    log(value.length.toString());
    // if(clength)
    try {
      final res = await api.getImages('&q=$value&image_type=photo&page=$page&per_page=$perPage');
      if (res.success!) {
        page++;
        pagingController.appendPage(res.data!.hits!, page);
        notifyListeners();
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
