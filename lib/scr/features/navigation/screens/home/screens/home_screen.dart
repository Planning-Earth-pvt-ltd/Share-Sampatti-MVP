import 'package:share_sampatti_mvp/app/app.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final user = ref.watch(userProvider);

    // MARK: Name
    Widget name() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Inter(
            text: "Namaste, ${user.fullName}",
            fontSize: appDimensions.fontL,
            fontWeight: FontWeight.w600,
          ),
          GestureDetector(
            onTap: () => context.push("/profile"),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.profileBackground,
              child: Inter(
                text: user.fullName.substring(0, 1),
                fontSize: appDimensions.fontM,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ).withPadAll(appDimensions.horizontalPaddingM);
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NAME
          name(),

          // NET WORTH
          NetWorth(),

          // START INVESTMENT NOW
          Inter(
            text: "Start Investing Now",
            fontSize: appDimensions.fontL,
            fontWeight: FontWeight.w600,
          ).withPadAllCustom(0, 0, appDimensions.horizontalPaddingM, 0),
          Inter(
            text: "Start Investing Now",
            color: AppColors.lightGrey,
            fontSize: appDimensions.fontS,
            fontWeight: FontWeight.w500,
          ).withPadAllCustom(0, 0, appDimensions.horizontalPaddingM, 0),
          Invest(),

          // ADVERTISMENT
          Advertisment(),

          //EXPLORE BY REGIONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Inter(
                text: "Explore By Regions",
                fontSize: appDimensions.fontL,
                fontWeight: FontWeight.w500,
              ),
              CustomElevatedButton(
                onPressed: () => context.push("/explore"),
                text: "View All",
                width: 72,
                height: 25,
                radius: 6,
                fontSize: 12,
              ),
            ],
          ).withPadAll(appDimensions.horizontalPaddingM),
          Explore(
            explore: AppConstants.regions,
            images: AppAssets.regionsImages,
          ),
          SizedBox(height: appDimensions.verticalSpaceM),

          // TRACK NOW
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(
                  appDimensions.radiusM,
                ),
                child: Image.asset(AppAssets.trackNow),
              ).withPadHorizontal(appDimensions.horizontalPaddingM),
              CustomElevatedButton(
                onPressed: () {},
                text: "Track Now",
                width: 91,
                height: 27,
                radius: 6,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ).withPadAllCustom(
                0,
                appDimensions.verticalSpaceL,
                appDimensions.horizontalSpaceM,
                0,
              ),
            ],
          ),

          //EXPLORE BY Theme
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Inter(
                text: "Explore By Theme",
                fontSize: appDimensions.fontL,
                fontWeight: FontWeight.w500,
              ),
              CustomElevatedButton(
                onPressed: () => context.push("/explore"),
                text: "View All",
                width: 72,
                height: 25,
                radius: 6,
                fontSize: 12,
              ),
            ],
          ).withPadAll(appDimensions.horizontalPaddingM),
          Explore(explore: AppConstants.themes, images: AppAssets.themesImages),
          SizedBox(height: appDimensions.verticalSpaceM),

          // CALL NOW
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(
                  appDimensions.radiusM,
                ),
                child: Image.asset(AppAssets.chatNow),
              ).withPadHorizontal(appDimensions.horizontalPaddingM),
              CustomElevatedButton(
                onPressed: () => context.push("/chatBot"),
                text: "Chat Now",
                width: 91,
                height: 27,
                radius: 6,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ).withPadAllCustom(
                0,
                appDimensions.verticalPaddingS,
                0,
                appDimensions.horizontalPaddingL,
              ),
            ],
          ),

          //PROPERTY
          BottomProperty(),
        ],
      ),
    );
  }
}
