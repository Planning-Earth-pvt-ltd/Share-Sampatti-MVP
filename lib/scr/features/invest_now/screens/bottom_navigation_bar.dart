import 'package:share_sampatti_mvp/app/app.dart';

class SellOrBuy extends ConsumerWidget {
  const SellOrBuy({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);

    return Container(
      padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
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
          Inter(text: "₹ $price/-", fontSize: 24),
          SizedBox(height: appDimensions.verticalSpaceM),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                onPressed: () => context.push("/paymentConfirmation"),
                backgroundColor: AppColors.grey,
                text: "Sell",
                textColor: AppColors.lightGrey,
                width: appDimensions.width * 0.43,
              ),
              CustomElevatedButton(
                onPressed: () => context.push("/paymentConfirmation"),
                text: "Buy",
                width: appDimensions.width * 0.43,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
