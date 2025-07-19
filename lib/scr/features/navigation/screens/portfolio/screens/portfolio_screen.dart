import 'package:share_sampatti_mvp/app/app.dart';

class PortfolioScreen extends ConsumerWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChartView = ref.watch(viewToggleProvider);
    final appDimensions = ref.watch(appDimensionsProvider);

    balanceCard() {
      return Container(
        width: appDimensions.width,
        margin: EdgeInsets.symmetric(
          horizontal: appDimensions.horizontalPaddingM,
          vertical: appDimensions.verticalPaddingS,
        ),
        padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(appDimensions.radiusM),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Inter(text: "SHUBHAM PATEL", fontSize: appDimensions.fontS),
            SizedBox(height: appDimensions.verticalSpaceS),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  3,
                  (index) => Inter(
                    text: "****",
                    fontSize: appDimensions.fontL,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Inter(
                  text: "7423",
                  fontSize: appDimensions.fontL,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: appDimensions.verticalSpaceL),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Inter(text: "BALANCE", color: AppColors.lightGrey),
                Inter(
                  text: "₹ 2,40,655",
                  fontSize: appDimensions.fontM,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      );
    }

    returnSection() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Inter(
                text: "Portfolio",
                color: AppColors.lightGrey,
                fontSize: appDimensions.fontXXS,
              ),
              Inter(
                text: "Current Value",
                color: AppColors.lightGrey,
                fontSize: appDimensions.fontXXS,
              ),
            ],
          ),
          SizedBox(height: appDimensions.verticalPaddingXS),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Inter(text: "₹ 2.13L", fontSize: appDimensions.fontM),
                  SizedBox(width: appDimensions.horizontalSpaceXS),
                  Inter(
                    text: "25.94%",
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: appDimensions.fontXXS,
                  ),
                ],
              ),
              Inter(
                text: "All Time Returns",
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ).withPadSymmetric(
        appDimensions.verticalPaddingXS,
        appDimensions.horizontalPaddingM,
      );
    }

    propertyList() {
      final items = [
        'Mohali Prime Land',
        'Delhi Invst. Land',
        'Himachal Invst. Land',
      ];

      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) => Column(
          children: [
            if (index != 0)
              Divider(
                color: AppColors.dividerColor,
              ).withPadSymmetric(0, appDimensions.horizontalPaddingM),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(AppAssets.investNowProperty),
              ),
              title: Inter(text: "${items[index]} Property Shares"),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Inter(text: "₹ 56.84 K", fontSize: appDimensions.fontXXS),
                  Inter(
                    text: "28.14%",
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: appDimensions.fontXXS,
                  ),
                ],
              ),
            ).withPadVertical(appDimensions.verticalPaddingXS),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBar.appbar(context, "Portfolio"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            balanceCard(),
            Divider(
              color: AppColors.dividerColor,
              thickness: 2,
            ).withPadSymmetric(0, appDimensions.horizontalPaddingM),
            returnSection(),
            Divider(
              color: AppColors.dividerColor,
              thickness: 2,
            ).withPadSymmetric(0, appDimensions.horizontalPaddingM),
            isChartView
                ? Container(
                    height: 200,
                    color: Colors.green.withOpacity(0.2),
                    child: Center(
                      child: Text(
                        'Chart View',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : propertyList(),
          ],
        ),
      ),
    );
  }
}
