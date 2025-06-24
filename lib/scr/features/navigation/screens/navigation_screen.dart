import 'package:share_sampatti_mvp/app/app.dart';

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationProvider);

    bottomIcon(String icon, Color color) {
      return SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    }

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
            BottomNavigationBarItem(
              icon: bottomIcon(
                AppAssets.home,
                currentIndex == 0 ? AppColors.lightGreen : AppColors.lightGrey,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: bottomIcon(
                AppAssets.invest,
                currentIndex == 1 ? AppColors.lightGreen : AppColors.lightGrey,
              ),
              label: "Invest",
            ),
            BottomNavigationBarItem(
              icon: bottomIcon(
                AppAssets.save,
                currentIndex == 2 ? AppColors.lightGreen : AppColors.lightGrey,
              ),
              label: "Save",
            ),
            BottomNavigationBarItem(
              icon: bottomIcon(
                AppAssets.portfolio,
                currentIndex == 3 ? AppColors.lightGreen : AppColors.lightGrey,
              ),
              label: "Portfolio",
            ),
          ],
        ),
      ),
    );
  }
}
