import 'package:share_sampatti_mvp/app/app.dart';

final navigationProvider = StateProvider<int>((ref) => 0);

class Navigation {
  static const List<Widget> screen = [
    HomeScreen(),
    InvestmentScreen(),
    SaveScreen(),
    PortfolioScreen(),
  ];
}
