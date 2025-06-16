import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class Navigation extends ConsumerWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationProvider);

    return SafeArea(
      child: Scaffold(
        body: NavigationScreens.screen[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => ref.read(navigationProvider.notifier).state = index,
          currentIndex: currentIndex,
          backgroundColor: AppColors.darkGrey,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: AppColors.lightGrey,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w400,
          ),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.badge), label: "Invest"),
          ],
        ),
      ),
    );
  }
}
