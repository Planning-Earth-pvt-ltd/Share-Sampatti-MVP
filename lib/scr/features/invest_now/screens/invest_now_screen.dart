import 'package:intl/intl.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class InvestNowScreen extends ConsumerWidget {
  const InvestNowScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPropertyProv = ref.watch(currentPropertyProvider(id));
    final showMore = ref.watch(showMoreProvider);
    final appDimensions = ref.watch(appDimensionsProvider);
    final width = appDimensions.width;
    final height = appDimensions.height;

    formatNumber(dynamic value) =>
        NumberFormat.decimalPattern("en_IN").format(value);

    buildHeader(String text) {
      return Inter(
        text: text,
        fontSize: appDimensions.fontL,
        fontWeight: FontWeight.w600,
      );
    }

    buildCard(String text, Color backgroundColor, Color textColor) {
      return Container(
        margin: EdgeInsets.only(
          right: appDimensions.horizontalPaddingS,
          bottom: appDimensions.verticalPaddingXS,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(appDimensions.radiusS),
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
                borderRadius: BorderRadius.circular(appDimensions.radiusS),
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
            SizedBox(height: appDimensions.verticalSpaceS),

            Inter(
              text: bottomText,
              color: AppColors.lightGrey,
              textAlign: TextAlign.center,
              fontSize: appDimensions.fontXXS,
            ),
          ],
        ).withPadHorizontal(appDimensions.horizontalSpaceS),
      );
    }

    buildPropertyDetails(String key, String value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Inter(text: key),
          Inter(text: value, color: AppColors.lightGrey),
        ],
      ).withPadSymmetric(3, appDimensions.horizontalPaddingM);
    }

    return SafeArea(
      child: currentPropertyProv.when(
        data: (data) {
          final price = formatNumber(data.pricePerToken);

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // MARK: PROPERTY IMAGE
                  Stack(
                    children: [
                      Image.network(
                        data.images.isNotEmpty
                            ? data.images[0]
                            : "https://res.cloudinary.com/dowsrgchg/image/upload/v1752232642/properties/gxbw2tvj3qa2wtill46v.webp",
                        height: height * 0.3,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      IconButton(
                        onPressed: () => context.pop(),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.darkGrey,
                        ),
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: AppColors.lightGrey,
                        ),
                      ).withPadAll(appDimensions.horizontalPaddingS),
                    ],
                  ),

                  // MARK: CARDS
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                      horizontal: appDimensions.horizontalPaddingM,
                      vertical: appDimensions.verticalPaddingS,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        appDimensions.radiusM,
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
                        buildHeader(data.title),
                        SizedBox(height: appDimensions.verticalSpaceM),
                        Wrap(
                          children: [
                            buildCard(
                              data.propertyCategory!,
                              Theme.of(context).colorScheme.primary,
                              AppColors.darkGrey,
                            ),
                            buildCard(
                              data.propertyType!,
                              AppColors.black,
                              Theme.of(context).colorScheme.secondary,
                            ),
                            buildCard(
                              data.status!,
                              AppColors.black,
                              Theme.of(context).colorScheme.secondary,
                            ),
                          ],
                        ),
                        SizedBox(height: appDimensions.verticalSpaceM),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 12,
                                decoration: BoxDecoration(
                                  color: AppColors.darkGrey,
                                  borderRadius: BorderRadius.circular(
                                    appDimensions.radiusS,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary.withAlpha(40),
                                    ),
                                  ],
                                ),
                                child: FractionallySizedBox(
                                  widthFactor: data.progressPercentage * 0.01,
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(
                                        appDimensions.radiusS,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.03),
                            Inter(
                              text: "${data.progressPercentage}% Funded",
                              color: AppColors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // MARK: INVESTMENT ARENA
                  buildHeader(
                    "Investment Arena",
                  ).withPadAll(appDimensions.horizontalPaddingM),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            "~₹$price",
                            "Potential Long Term SQFT PRICE",
                          ),
                          buildArena(
                            null,
                            "2.57x",
                            "Potential Long capital Grains",
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: appDimensions.verticalSpaceM),
                  Divider(thickness: 2, color: AppColors.dividerColor),

                  // MARK: GRAPH
                  buildHeader(
                    "Price per Share",
                  ).withPadAll(appDimensions.horizontalPaddingM),
                  Image.asset(
                    AppAssets.graph,
                  ).withPadHorizontal(appDimensions.horizontalPaddingM),

                  // ABOUT
                  buildHeader(
                    "About the Opportunity",
                  ).withPadAll(appDimensions.horizontalPaddingM),
                  Inter(
                    text: data.description!,
                    maxLines: showMore ? null : 1,
                  ).withPadHorizontal(appDimensions.horizontalPaddingM),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextButton(
                        text: showMore ? "Show More" : "Show Less",
                        onTap: () => ref.read(showMoreProvider.notifier).state =
                            !showMore,
                      ),
                      CustomElevatedButton(
                        onPressed: () => context.push("/investNowDocument/$id"),
                        height: height * 0.05,
                        width: width * 0.1,
                        radius: appDimensions.radiusS,
                        text: "View Opportunity Document",
                        fontSize: appDimensions.fontXS,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ).withPadSymmetric(
                    appDimensions.verticalPaddingS,
                    appDimensions.horizontalPaddingM,
                  ),

                  buildHeader(
                    "Property Information",
                  ).withPadSymmetric(10, appDimensions.horizontalPaddingM),

                  buildPropertyDetails(
                    "Total Area SQFT",
                    data.totalAreaSqft.toString(),
                  ),
                  buildPropertyDetails(
                    "Total Tokens",
                    data.totalTokens.toString(),
                  ),
                  buildPropertyDetails(
                    "Currency Valuation",
                    "₹ ${formatNumber(data.currentValuation)}",
                  ),
                  buildPropertyDetails(
                    "Price Per SQFT",
                    "₹ ${formatNumber(data.pricePerSqFt)}",
                  ),
                  buildPropertyDetails(
                    "Price Per Token",
                    "₹ ${formatNumber(data.pricePerToken)}",
                  ),
                  SizedBox(height: appDimensions.verticalSpaceM),
                ],
              ),
            ),
            bottomNavigationBar: SellOrBuy(id: id, price: data.pricePerToken),
          );
        },
        error: (e, _) => Center(child: Text('Invest Now Error: $e')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
