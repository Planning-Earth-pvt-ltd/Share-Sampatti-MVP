import 'package:share_sampatti_mvp/app/app.dart';

final exploreCategoriesController = StateProvider<int>((ref) => 0);
final exploreRegionController = StateProvider<int>((ref) => 1);

final exploreFilterController = StateProvider<bool>((ref) => false);
