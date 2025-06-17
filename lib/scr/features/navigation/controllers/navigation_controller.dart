import 'package:share_sampatti_mvp/app/app.dart';

final navigationProvider = StateProvider<int>((ref) => 0);

class NavigationScreens {
  static const List<Widget> screen = [
    HomeScreen(),
    Search(),
    InvestmentsScreen(),
  ];
}
