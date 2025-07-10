import 'package:share_sampatti_mvp/app/app.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final categoriesControllers = ref.watch(exploreCategoriesController);
    final propertyProv = ref.watch(propertyProvider);

    buildCategories() {
      return SizedBox(
        height: 35,
        child: ListView.builder(
          itemCount: AppConstants.exploreTheme.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: appDimensions.horizontalPaddingS),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () =>
                ref.read(exploreCategoriesController.notifier).state = index,
            child: Container(
              margin: EdgeInsets.only(right: appDimensions.horizontalPaddingS),
              padding: (index == 0)
                  ? EdgeInsets.symmetric(horizontal: 20)
                  : EdgeInsets.only(left: 1.5, right: 10),
              decoration: BoxDecoration(
                color: (categoriesControllers == index)
                    ? Theme.of(context).colorScheme.primary
                    : null,
                borderRadius: BorderRadius.circular(appDimensions.radiusL),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              child: Row(
                children: [
                  if (index != 0) ...[
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(
                        AppAssets.themesImages[index - 1],
                      ),
                    ),
                    SizedBox(width: appDimensions.horizontalSpaceXS),
                  ],
                  Inter(
                    text: AppConstants.exploreTheme[index],
                    fontWeight: FontWeight.w600,
                    color: (categoriesControllers == index)
                        ? AppColors.darkGrey
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    buildContainers() {
      final listHeight = (325 + (2 * appDimensions.verticalPaddingS));
      return SizedBox(
        height: listHeight * 10,
        child: propertyProv.when(
          data: (property) => ListView.builder(
            itemCount: 10,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final bookmark = ref.watch(bookmarkProvider(index));

              return Container(
                height: 325,
                margin: EdgeInsets.symmetric(
                  vertical: appDimensions.verticalPaddingS,
                ),
                padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(appDimensions.radiusM),
                  border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.white),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: appDimensions.width,
                      alignment: Alignment.topRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          appDimensions.radiusM,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            property[index % property.length].images[0],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () =>
                            ref.read(bookmarkProvider(index).notifier).state =
                                !bookmark,
                        icon: Icon(
                          Icons.bookmark,
                          color: bookmark
                              ? Theme.of(context).colorScheme.primary
                              : AppColors.darkGrey,
                        ),
                      ),
                    ),
                    Divider(thickness: 2, color: AppColors.dividerColor),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Inter(
                            text: property[index % property.length].title,
                            maxLines: 2,
                            fontSize: appDimensions.fontM,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Inter(
                              text: "Absolute Returns:",
                              color: AppColors.lightGrey,
                              fontSize: appDimensions.fontS,
                            ),
                            Inter(
                              text: "24.1 %",
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: appDimensions.fontM,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          error: (e, _) => Center(child: Text('Error: $e')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar.appbar(context, "Explore"),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: appDimensions.verticalPaddingXS),
          child: Column(children: [buildCategories(), buildContainers()]),
        ),
      ),
    );
  }
}
