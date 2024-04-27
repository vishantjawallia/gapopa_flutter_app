// ignore_for_file: body_might_complete_normally_nullable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gapopa_flutter_app/api/api_repo.dart';
import 'package:gapopa_flutter_app/models/image_model.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';

final api = ApiRepo.instance;

class HomeViewModel extends BaseViewModel {
  List<Hits> tempImages = [];
  var page = 1;
  int curLength = 0;
  var perPage = 30;

  PagingController<int, Hits> pagingController = PagingController(firstPageKey: 1);

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
    if (curLength <= value.length) {
      print("Count");
    } else {
      print("Cot");
    }
    try {
      setBusy(true);
      await Future.delayed(const Duration(seconds: 1));
      final res = await api.getImages('&q=$value&image_type=photo&page=1&per_page=$perPage');
      setBusy(false);
      if (res.success!) {
        pagingController.appendPage(res.data!.hits!, page);
      } else {
        pagingController.appendLastPage([]);
      }
      rebuildUi();
    } catch (error) {
      setBusy(false);
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

  Widget? buildCounter(
    BuildContext context, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  }) {
    curLength = currentLength;
    notifyListeners();
  }
}
