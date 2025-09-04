import 'package:share_sampatti_mvp/app/app.dart';

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationProvider);

    bottomIcon(int currentIndex, int index) {
      return SvgPicture.asset(
        AppAssets.navigationIcons[index],
        colorFilter: ColorFilter.mode(
          currentIndex == index ? AppColors.lightGreen : AppColors.lightGrey,
          BlendMode.srcIn,
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Navigation.screen[currentIndex],
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
            BottomNavigationBarItem(
              icon: bottomIcon(currentIndex, 0),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: bottomIcon(currentIndex, 1),
              label: "Invest",
            ),
            BottomNavigationBarItem(
              icon: bottomIcon(currentIndex, 2),
              label: "Save",
            ),
            BottomNavigationBarItem(
              icon: bottomIcon(currentIndex, 3),
              label: "Portfolio",
            ),
          ],
        ),
      ),
    );
  }
}
