import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_sampatti_mvp/scr/features/search/search.dart';
import 'package:share_sampatti_mvp/scr/src.dart';

final navigationProvider = StateProvider<int>((ref) => 0);

class NavigationScreens {
  static const List<Widget> screen = [Home(), Search(), Investments()];
}
