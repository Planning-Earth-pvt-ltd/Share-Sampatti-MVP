import 'package:share_sampatti_mvp/app/app.dart';

class NetWorth extends ConsumerWidget {
  const NetWorth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);

    return Container(
      margin: EdgeInsets.only(bottom: appDimensions.verticalPaddingS),
      padding: EdgeInsets.symmetric(
        horizontal: appDimensions.horizontalPaddingM,
        vertical: appDimensions.verticalPaddingXS,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        borderRadius: BorderRadius.circular(appDimensions.radiusM),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Inter(
            text: "Net Worth",
            fontSize: appDimensions.fontM,
            fontWeight: FontWeight.w500,
            color: AppColors.lightGrey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Inter(
                text: "₹ 2,34,560",
                fontSize: appDimensions.fontL,
                fontWeight: FontWeight.w500,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: appDimensions.iconsM,
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
