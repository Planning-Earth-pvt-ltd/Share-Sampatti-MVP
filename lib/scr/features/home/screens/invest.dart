import 'package:share_sampatti_mvp/app/app.dart';

class Invest extends ConsumerWidget {
  const Invest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);

    return SizedBox(
      height: appDimensions.width * 0.6,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: appDimensions.horizontalPaddingS),
        itemBuilder: (context, index) => Container(
          height: appDimensions.width * 0.6,
          width: appDimensions.width * 0.65,
          margin: EdgeInsets.only(left: appDimensions.horizontalPaddingS),
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(appDimensions.radiusM),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.vertical(
                  top: Radius.circular(appDimensions.radiusM),
                ),
                child: Image.asset(AppAssets.startInvestingNow),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Inter(
                    text: "Property Title",
                    fontSize: appDimensions.fontS,
                    fontWeight: FontWeight.w500,
                  ),
                  Divider(thickness: 2, color: AppColors.dividerColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Inter(
                            text: "₹ 2,34,560 /-",
                            fontSize: appDimensions.fontS,
                            fontWeight: FontWeight.w500,
                          ),
                          Inter(
                            text: "per\nSQFT",
                            color: AppColors.lightGrey,
                            fontSize: appDimensions.fontXXS,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => context.push("/investNow"),
                        child: Inter(
                          text: "Invest Now",
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: appDimensions.fontS,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ).withPadAll(appDimensions.horizontalPaddingXS),
            ],
          ),
        ),
      ),
    ).withPadSymmetric(appDimensions.horizontalPaddingS, 0);
  }
}
