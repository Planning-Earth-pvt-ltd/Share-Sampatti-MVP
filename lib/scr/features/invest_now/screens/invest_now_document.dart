import 'package:share_sampatti_mvp/app/app.dart';

class InvestNowDocument extends ConsumerWidget {
  const InvestNowDocument({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final height = appDimensions.height;

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

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // MARK: PROPERTY IMAGE
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
                  ).withPadAll(appDimensions.horizontalPaddingS),
                ],
              ),

              // MARK: CARDS
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: appDimensions.horizontalPaddingM,
                  vertical: appDimensions.verticalPaddingS,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(appDimensions.radiusM),
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                child: buildHeader("Mohali Prime Land Investment Opportunity"),
              ),
              SizedBox(height: appDimensions.verticalPaddingM),

              ...List.generate(
                InvestNow.documents.length,
                (index) => buildDocument(InvestNow.documents[index]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SellOrBuy(),
      ),
    );
  }
}
