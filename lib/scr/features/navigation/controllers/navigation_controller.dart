import 'package:share_sampatti_mvp/app/app.dart';

// NAVIGATION
final navigationProvider = StateProvider<int>((ref) => 0);

class Navigation {
  static const List<Widget> screen = [
    HomeScreen(),
    InvestmentScreen(),
    SaveScreen(),
    PortfolioScreen(),
  ];
}

// PROPERTIES
final PropertyService _propertyService = PropertyService();
final propertyProvider = FutureProvider<List<PropertyModel>>(
  (ref) async => _propertyService.fetchProperty(),
);

// BOOKMARKS
final bookMarkProvider = StateNotifierProvider<BookMarkNotifier, Set<String>>(
  (ref) => BookMarkNotifier(),
);

class BookMarkNotifier extends StateNotifier<Set<String>> {
  BookMarkNotifier() : super({});

  void toggleMarker(String propertyId) {
    if (state.contains(propertyId)) {
      state = {...state}..remove(propertyId);
    } else {
      state = {...state, propertyId};
    }
  }

  bool isBookMarked(String propertyId) => state.contains(propertyId);
}
