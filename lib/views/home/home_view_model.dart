import 'package:gapopa_flutter_app/api/api_repo.dart';
import 'package:gapopa_flutter_app/models/image_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';

final api = ApiRepo.instance;

class HomeViewModel extends BaseViewModel {
  List<Hits> tempImages = [];
  var page = 1;
  var perPage = 100;

  // static const _pageSize = 20;

  PagingController<int, Hits> pagingController = PagingController(firstPageKey: 1);

  HomeViewModel() {}

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

  void changeDarkMode() {}
}
