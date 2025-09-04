import 'package:share_sampatti_mvp/app/app.dart';

final exploreCategoriesController = StateProvider<int>((ref) => 0);
final exploreRegionController = StateProvider<int>((ref) => 0);

final exploreFilterController = StateProvider<bool>((ref) => false);

final _services = ExploreServices();
final exploreProvider = FutureProvider<List<PropertyModel>>((ref) {
  final categoryIndex = ref.watch(exploreCategoriesController);
  final regionIndex = ref.watch(exploreRegionController) - 1;

  return _services.fetchExploredProperty(
    category: (categoryIndex != 0)
        ? AppConstants.exploreTheme[categoryIndex]
        : null,
    state: (regionIndex != -1) ? AppConstants.regions[regionIndex] : null,
  );
});

// final disposeController = StateProvider<void>((ref) {
//   ref.invalidate(exploreCategoriesController);
//   ref.invalidate(exploreRegionController);
//   ref.invalidate(exploreFilterController);
//   ref.invalidate(exploreProvider);
// });
