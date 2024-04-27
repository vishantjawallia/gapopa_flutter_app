part of 'home_view.dart';

class _HomeDesktop extends StatelessWidget {
  final HomeViewModel viewModel;

  const _HomeDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: Text(
                    'Pixabay Gallery',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(width: 20, height: 0.0),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue, // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextField(
                      onEditingComplete: viewModel.onSearchTap,
                      onChanged: viewModel.onSearchChangeses,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        hintText: 'Search anything here.....',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: viewModel.isBusy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : PagedGridView<int, Hits>(
                    pagingController: viewModel.pagingController,
                    showNewPageProgressIndicatorAsGridChild: false,
                    showNewPageErrorIndicatorAsGridChild: false,
                    showNoMoreItemsIndicatorAsGridChild: false,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _getCrossAxisCount(context),
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    builderDelegate: PagedChildBuilderDelegate<Hits>(
                      noMoreItemsIndicatorBuilder: (context) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(' No More Data Found!'),
                          ),
                        );
                      },
                      itemBuilder: (context, item, index) => BounceButton(
                        onPressed: () => Get.toNamed(ImageDetailView.routeName, arguments: item),
                        child: SizedBox(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Hero(
                                tag: 'hero-img${item.id}',
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.low,
                                  imageUrl: item.largeImageURL ?? "https://cdn.pixabay.com/photo/2024/04/01/05/18/green-8667981_1280.jpg",
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
                              Positioned(
                                  bottom: 0,
                                  width: Get.pixelRatio * 100,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 6),
                                    color: Colors.grey.withOpacity(0.4),
                                    child: Flexible(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.people, color: Colors.black54),
                                              const SizedBox(width: 2),
                                              Text(
                                                '${item.views}',
                                                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.library_add_check_sharp, color: Colors.red),
                                              const SizedBox(width: 2),
                                              Text(
                                                '${item.likes}',
                                                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    // Determine the cross axis count based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth ~/ 200; // Set the maximum width for each item
    return crossAxisCount > 1 ? crossAxisCount : 1; // Ensure at least one column
  }
}
