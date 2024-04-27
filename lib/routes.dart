import 'package:gapopa_flutter_app/views/home/home_view.dart';
import 'package:gapopa_flutter_app/views/image_detail/image_detail_view.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: HomeView.routeName, page: () => const HomeView()),
  GetPage(name: ImageDetailView.routeName, page: () => const ImageDetailView()),
];
