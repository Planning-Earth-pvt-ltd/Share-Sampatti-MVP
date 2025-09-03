import 'package:share_sampatti_mvp/app/app.dart';

class InvestNowDocument extends ConsumerWidget {
  const InvestNowDocument({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPropertyProv = ref.watch(currentPropertyProvider(id));
    final appDimensions = ref.watch(appDimensionsProvider);
    final height = appDimensions.height;
    final width = appDimensions.width;

    buildHeader(String text) {
      return Inter(
        text: text,
        fontSize: appDimensions.fontL,
        fontWeight: FontWeight.w500,
      );
    }

    buildDocument(Map<String, String> docs) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.file,
                    height: height * 0.05,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: appDimensions.horizontalSpaceXS),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Inter(
                        text: docs["title"]!,
                        fontSize: appDimensions.fontM,
                        fontWeight: FontWeight.w600,
                      ),
                      Inter(
                        text: "Updated on ${docs["date"]!}",
                        color: AppColors.lightGrey,
                        fontSize: appDimensions.fontS,
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppAssets.download,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ).withPadHorizontal(appDimensions.horizontalPaddingM),
          Divider(thickness: 2, color: AppColors.dividerColor),
        ],
      );
    }

    // MARK: List
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
                    borderRadius: BorderRadius.circular(appDimensions.radiusM),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: widthFactor * 0.01,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(
                          appDimensions.radiusM,
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
      child: currentPropertyProv.when(
        data: (data) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // MARK: PROPERTY IMAGE
                  Stack(
                    children: [
                      Image.network(
                        data.images[0],
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
                        Inter(
                          text: "${data.address}, ${data.city}, ${data.state}",
                          color: AppColors.lightGrey,
                          fontSize: appDimensions.fontXXS,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: appDimensions.verticalPaddingM),

                  ...List.generate(
                    InvestNow.documents.length,
                    (index) => buildDocument(InvestNow.documents[index]),
                  ),

                  // MARK: ABOUT
                  buildHeader(
                    "Investment Benefits",
                  ).withPadAll(appDimensions.horizontalPaddingM),
                  Inter(
                    text:
                        "• Lorem Ipsum is simply dummy text of the printing and typesetting industry. \n"
                        "• Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took.\n"
                        "• A galley of type and scrambled it to make a type specimen book.\n"
                        "• A galley of type and scrambled it to make a type specimen book.",
                  ).withPadHorizontal(appDimensions.horizontalPaddingM),

                  // MARK: RETURN COMPARISON
                  buildHeader(
                    "Returns Comparison",
                  ).withPadAll(appDimensions.horizontalPaddingM),
                  buildList("Share Sampatti Private Oppurtunity", 88),
                  buildList("AAA Bonds", 56),
                  buildList("Fixed Deposits", 34),
                  buildList("Gold Investments", 76),
                ],
              ),
            ),
            bottomNavigationBar: SellOrBuy(id: id, price: data.pricePerSqFt),
          );
        },
        error: (e, _) => Center(child: Text('Invest Now Error: $e')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
