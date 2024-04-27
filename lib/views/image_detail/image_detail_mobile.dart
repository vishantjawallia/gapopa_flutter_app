part of image_detail_view;

// ignore: must_be_immutable
class _ImageDetailMobile extends StatelessWidget {
  final ImageDetailViewModel viewModel;

  _ImageDetailMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ImageDetailMobile')),
    );
  }
}