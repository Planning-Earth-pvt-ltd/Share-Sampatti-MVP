import 'package:share_sampatti_mvp/app/app.dart';

class InvestNowScreen extends ConsumerWidget {
  const InvestNowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final width = appDimensions.screenWidth(context);
    final height = appDimensions.screenWidth(context);

    buildHeader(String text) {
      return Inter(text: text, fontSize: 24, fontWeight: FontWeight.w500);
    }

    buildCard(String text, Color backgroundColor, Color textColor) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(
            appDimensions.radiusMedium(context),
          ),
        ),
        child: Inter(text: text, color: textColor, fontWeight: FontWeight.w500),
      );
    }

    buildArena(Widget? child, String? containerText, String bottomText) {
      return Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: width * 0.15,
              width: width * 0.25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: child != null
                    ? Theme.of(context).colorScheme.primary
                    : AppColors.darkGrey,
                borderRadius: BorderRadius.circular(
                  appDimensions.radiusMedium(context),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 15,
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(40),
                  ),
                ],
              ),
              child: child ?? Inter(text: containerText!),
            ),
            SizedBox(height: height * 0.02),
            Inter(
              text: bottomText,
              color: AppColors.lightGrey,
              textAlign: TextAlign.center,
              fontSize: 12,
            ),
          ],
        ).withPadHorizontal(width * 0.03),
      );
    }

    buildList(String text, double widthFactor) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Inter(text: text),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      appDimensions.radiusMedium(context),
                    ),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: widthFactor * 0.01,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(
                          appDimensions.radiusMedium(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.03),
              Inter(
                text: "${widthFactor.toInt()}%",
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: width * 0.05),
        ],
      ).withPadHorizontal(width * 0.05);
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PROPERTY IMAGE
              Stack(
                children: [
                  Image.asset(AppAssets.investNowProperty),
                  IconButton(
                    onPressed: () => context.pop(),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.darkGrey,
                    ),
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: AppColors.lightGrey,
                    ),
                  ).withPadAll(width * 0.02),
                ],
              ),

              // CARDS
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.05,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    appDimensions.radiusLarge(context),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader("Mohali Prime Land Investment Opportunity"),
                    SizedBox(height: height * 0.03),
                    Wrap(
                      children: [
                        buildCard(
                          "Residential",
                          Theme.of(context).colorScheme.primary,
                          AppColors.darkGrey,
                        ),
                        SizedBox(width: width * 0.03),
                        buildCard(
                          "Private Opportunity",
                          AppColors.black,
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // INVESTMENT ARENA
              buildHeader("Investment Arena").withPadAll(width * 0.05),
              Row(
                children: [
                  buildArena(
                    Wrap(
                      children: [
                        Inter(text: "~11%", color: AppColors.darkGrey),
                        SvgPicture.asset(
                          AppAssets.arrowUp,
                          colorFilter: ColorFilter.mode(
                            Colors.green.shade900,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                    null,
                    "Potential Long Term ROI",
                  ),
                  buildArena(
                    null,
                    "~₹18,500",
                    "Potential Long Term SQFT PRICE",
                  ),
                  buildArena(null, "2.57x", "Potential Long capital Grains"),
                ],
              ),
              SizedBox(height: height * 0.05),
              Divider(thickness: 2, color: AppColors.dividerColor),

              // GRAPH
              buildHeader("Price per Share").withPadAll(width * 0.05),
              Image.asset(AppAssets.graph).withPadHorizontal(width * 0.05),

              // ABOUT
              buildHeader("About the Opportunity").withPadAll(width * 0.05),
              Inter(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              ).withPadHorizontal(width * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTextButton(text: "Show More"),
                  buildCard(
                    "View Opportunity Document",
                    AppColors.black,
                    Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ).withPadSymmetric(height * 0.05, width * 0.05),

              // ABOUT
              buildHeader("Investment Benefits").withPadAll(width * 0.05),
              Inter(
                text:
                    "• Lorem Ipsum is simply dummy text of the printing and typesetting industry. \n"
                    "• Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took.\n"
                    "• A galley of type and scrambled it to make a type specimen book.\n"
                    "• A galley of type and scrambled it to make a type specimen book.",
              ).withPadHorizontal(width * 0.05),

              // RETURN COMPARISON
              buildHeader("Returns Comparison").withPadAll(width * 0.05),
              buildList("Share Sampatti Private Oppurtunity", 88),
              buildList("AAA Bonds", 56),
              buildList("Fixed Deposits", 34),
              buildList("Gold Investments", 76),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(width * 0.05),
          decoration: BoxDecoration(color: AppColors.darkGrey),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Inter(
                text: "Price per SQFT",
                color: AppColors.lightGrey,
                fontSize: 20,
              ),
              Inter(text: "₹ 2,300.3/-", fontSize: 24),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    onPressed: () {},
                    backgroundColor: AppColors.grey,
                    text: "Sell",
                    textColor: AppColors.lightGrey,
                    width: width * 0.43,
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: "Buy",
                    width: width * 0.43,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
