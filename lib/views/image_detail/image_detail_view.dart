library image_detail_view;

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'image_detail_view_model.dart';

part 'image_detail_mobile.dart';
part 'image_detail_tablet.dart';
part 'image_detail_desktop.dart';

class ImageDetailView extends StatelessWidget {
  static const routeName = '/image_detail';

  const ImageDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImageDetailViewModel>.reactive(
      viewModelBuilder: () => ImageDetailViewModel(Get.arguments),
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (_) => _ImageDetailMobile(viewModel),
          desktop: (_) => _ImageDetailDesktop(viewModel),
          tablet: (_) => _ImageDetailMobile(viewModel),
        );
      },
    );
  }
}
