library home_view;

import 'package:gapopa_flutter_app/models/image_model.dart';
import 'package:gapopa_flutter_app/widgets/image_list_tile.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../widgets/bounce_button.dart';
import '../image_detail/image_detail_view.dart';
import 'home_view_model.dart';

part 'home_mobile.dart';
part 'home_tablet.dart';
part 'home_desktop.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  static const routeName = '/home';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.pagingController.addPageRequestListener((pageKey) {
          viewModel.fetchPage();
        });
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          desktop: (_) => _HomeDesktop(viewModel),
          tablet: (_) => _HomeDesktop(viewModel),
          mobile: (_) => _HomeDesktop(viewModel),
        );
      },
    );
  }
}
