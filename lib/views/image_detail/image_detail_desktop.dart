part of 'image_detail_view.dart';

// ignore: must_be_immutable, unused_element
class _ImageDetailDesktop extends StatelessWidget {
  ImageDetailViewModel viewModel;

  _ImageDetailDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail'),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.5,
          maxScale: 2,
          child: AspectRatio(
            aspectRatio: 1.86,
            child: Hero(
              tag: 'hero-img${viewModel.hitObj!.id}',
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
                imageUrl: viewModel.hitObj!.largeImageURL!,
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade500,
                    highlightColor: Colors.grey.shade400,
                    child: Container(
                      color: Colors.grey.shade100.withOpacity(0.8),
                      width: double.infinity,
                    ),
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.grey, size: 40),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
