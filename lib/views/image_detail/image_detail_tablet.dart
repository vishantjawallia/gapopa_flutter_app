part of image_detail_view;

// ignore: must_be_immutable
class _ImageDetailTablet extends StatelessWidget {
  final ImageDetailViewModel viewModel;

  _ImageDetailTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ImageDetailTablet')),
    );
  }
}