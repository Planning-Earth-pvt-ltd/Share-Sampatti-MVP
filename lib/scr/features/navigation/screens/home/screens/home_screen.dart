import 'package:share_sampatti_mvp/app/app.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);

    // MARK: Name
    Widget name() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Inter(
            text: "Namaste, Shubham",
            fontSize: appDimensions.fontL,
            fontWeight: FontWeight.w600,
          ),
          GestureDetector(
            onTap: () => context.push("/profile"),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.profileBackground,
              child: Inter(
                text: "S",
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
                onPressed: () {},
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
                onPressed: () {},
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
          Container(
            height: appDimensions.height * 0.3,
            margin: EdgeInsets.all(appDimensions.horizontalPaddingM),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(appDimensions.radiusM),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Theme.of(context).colorScheme.secondary.withAlpha(50),
                  blurRadius: 25.6,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Inter(
                            text: "Property Title",
                            fontSize: appDimensions.fontM,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: appDimensions.verticalSpaceS),
                          Inter(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                            maxLines: 4,
                            fontSize: appDimensions.fontXS,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: appDimensions.horizontalSpaceS),
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(
                        appDimensions.radiusM,
                      ),
                      child: Image.asset(
                        AppAssets.advertisementImages[0],
                        height: 115,
                        width: 158,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),

                CustomElevatedButton(
                  onPressed: () => context.push("/investNow"),
                  text: "Invest Now",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
