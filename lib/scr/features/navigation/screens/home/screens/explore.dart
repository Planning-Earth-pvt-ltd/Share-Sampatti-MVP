import 'package:share_sampatti_mvp/app/app.dart';

class Explore extends ConsumerWidget {
  const Explore({
    super.key,
    required this.explore,
    required this.images,
    this.filterType,
    this.onItemSelected,
  });

  final List<String> explore;
  final List<String> images;
  final FilterType? filterType;
  final Function(String)? onItemSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final filterState = ref.watch(exploreFilterProvider);
    final filterController = ref.read(exploreFilterProvider.notifier);

    // Check if an item is selected
    bool isItemSelected(String item) {
      if (filterType == FilterType.category) {
        return filterState.selectedCategory == item;
      } else if (filterType == FilterType.region) {
        return filterState.selectedRegion == item;
      }
      return false;
    }

    // Handle item selection
    void handleItemTap(String item) {
      if (filterType == FilterType.category) {
        final index = AppConstants.exploreTheme.indexOf(item);
        if (index != -1) {
          filterController.selectCategory(index);
        }
      } else if (filterType == FilterType.region) {
        final index = AppConstants.regions.indexOf(item);
        if (index != -1) {
          filterController.selectRegion(
            index + 1,
          ); // +1 because index 0 is "X" button
        }
      }

      // Navigate to explore screen
      context.push("/explore");

      // Call custom callback if provided
      onItemSelected?.call(item);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        explore.length,
        (index) => InkWell(
          onTap: () => handleItemTap(explore[index]),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: isItemSelected(explore[index])
                          ? Theme.of(context).colorScheme.primary.withAlpha(150)
                          : Theme.of(
                              context,
                            ).colorScheme.secondary.withAlpha(100),
                      spreadRadius: 1,
                      blurRadius: 14.8,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 79.87 * 0.5,
                  backgroundColor: isItemSelected(explore[index])
                      ? Theme.of(context).colorScheme.primary.withAlpha(50)
                      : null,
                  backgroundImage: AssetImage(images[index]),
                ),
              ),
              SizedBox(height: 10),
              Inter(
                text: explore[index],
                fontSize: appDimensions.fontS,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
