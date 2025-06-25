import 'package:share_sampatti_mvp/app/app.dart';

class InvestNowDocument extends ConsumerWidget {
  const InvestNowDocument({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final width = appDimensions.width;
    final height = appDimensions.height;

    buildHeader(String text) {
      return Inter(text: text, fontSize: 24, fontWeight: FontWeight.w500);
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
                    height: height * 0.09,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Inter(
                        text: docs["title"]!,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      Inter(
                        text: "Updated on ${docs["date"]!}",
                        color: AppColors.lightGrey,
                        fontSize: 16,
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
          ).withPadHorizontal(width * 0.05),
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
                  ).withPadAll(width * 0.02),
                ],
              ),

              // MARK: CARDS
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.05,
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
              SizedBox(height: height * 0.1),

              ...List.generate(
                InvestNow.documents.length,
                (index) => buildDocument(InvestNow.documents[index]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SellOrBuy(height: height, width: width),
      ),
    );
  }
}
