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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text(
                    'Pixabay Gallery',
                    style: context.textTheme.titleLarge,
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
                      controller: viewModel.searchController,
                      onChanged: viewModel.onSearchChangeses,
                      style: context.textTheme.titleSmall,
                      buildCounter: viewModel.buildCounter,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        hintText: 'Search anything here.....',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(onPressed: viewModel.changeDarkMode, icon: const Icon(Icons.dark_mode)),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Expanded(
            child: Visibility(
              replacement: const Center(child: CircularProgressIndicator()),
              visible: !viewModel.isBusy,
              child: PagedGridView<int, Hits>(
                pagingController: viewModel.pagingController,
                showNewPageProgressIndicatorAsGridChild: false,
                showNewPageErrorIndicatorAsGridChild: false,
                showNoMoreItemsIndicatorAsGridChild: false,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _getCrossAxisCount,
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
                    child: ImageListTile(id: item.id, imageUrl: item.webformatURL, views: item.views, likes: item.likes),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  get _getCrossAxisCount {
    double screenWidth = Get.size.width;
    int crossAxisCount = screenWidth ~/ 220;
    return crossAxisCount > 1 ? crossAxisCount : 1;
  }
}
