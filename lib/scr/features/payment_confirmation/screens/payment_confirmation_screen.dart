import 'package:share_sampatti_mvp/app/app.dart';

class PaymentConfirmationScreen extends ConsumerWidget {
  const PaymentConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final state = ref.watch(paymentConfirmationProvider);
    final controller = ref.read(paymentConfirmationProvider.notifier);
    double tradeValue = controller.requiredAmount;
    double fees = 110.0;
    double margin = tradeValue * 0.02;

    priceCard() {
      return Container(
        margin: EdgeInsets.only(bottom: appDimensions.verticalPaddingS),
        padding: EdgeInsets.symmetric(
          horizontal: appDimensions.horizontalPaddingM,
          vertical: appDimensions.verticalPaddingS,
        ),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          border: Border(
            bottom: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          borderRadius: BorderRadius.circular(appDimensions.radiusM),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Inter(
              text: "Price",
              color: Theme.of(context).colorScheme.primary,
              fontSize: appDimensions.fontM,
              fontWeight: FontWeight.w700,
            ),
            Inter(
              text: "₹ ${controller.pricePerSqft.toStringAsFixed(1)}",
              fontSize: appDimensions.fontM,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      );
    }

    quantitySelector() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: appDimensions.horizontalPaddingS,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: appDimensions.horizontalPaddingM,
          vertical: appDimensions.verticalPaddingS,
        ),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(appDimensions.radiusM),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Inter(
              text: "No. of SQFTs",
              color: Theme.of(context).colorScheme.primary,
              fontSize: appDimensions.fontS,
              fontWeight: FontWeight.w700,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: controller.decrement,
                  icon: Icon(
                    Icons.remove,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Container(
                  height: appDimensions.height * 0.05,
                  width: appDimensions.width * 0.2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(appDimensions.radiusS),
                  ),
                  child: Inter(
                    text: "${state.sqftCount}",
                    fontSize: appDimensions.fontS,
                  ),
                ),
                IconButton(
                  onPressed: controller.increment,
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    rowItem(String label, String value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Inter(text: label, fontWeight: FontWeight.w600),
          Inter(text: value, color: Theme.of(context).colorScheme.primary),
        ],
      );
    }

    purchaseSummary() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Inter(
            text: "Purchase Consideration",
            fontSize: appDimensions.fontS,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: appDimensions.horizontalSpaceXS),
          Container(
            padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(appDimensions.radiusM),
            ),
            child: Column(
              children: [
                rowItem('Trade Value', '₹ ${tradeValue.toStringAsFixed(0)}'),
                rowItem('Fees & Other Leives', '₹ ${fees.toStringAsFixed(1)}'),
                rowItem('Volatility Margin', '₹ ${margin.toStringAsFixed(2)}'),
                SizedBox(height: appDimensions.horizontalSpaceS),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Inter(
                      text: "Bulk Order Discount",
                      color: AppColors.lightGrey,
                      fontSize: appDimensions.fontXXS,
                    ),
                    Inter(
                      text: "Order 21 SQFT to activate",
                      color: AppColors.lightGrey,
                      fontSize: appDimensions.fontXXS,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).withPadHorizontal(appDimensions.horizontalPaddingS);
    }

    bottomCTA() {
      return Container(
        padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
        decoration: BoxDecoration(color: AppColors.darkGrey),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Inter(
                      text: "Balance",
                      color: AppColors.lightGrey,
                      fontSize: appDimensions.fontS,
                    ),
                    Inter(text: "₹ 0", fontSize: appDimensions.fontL),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Inter(
                      text: "Required",
                      color: AppColors.lightGrey,
                      fontSize: appDimensions.fontS,
                    ),
                    Inter(text: "₹ 6540.0", fontSize: appDimensions.fontL),
                  ],
                ),
              ],
            ),
            SizedBox(height: appDimensions.verticalSpaceM),
            CustomElevatedButton(
              onPressed: () => context.push("/paymentConfirmation"),
              text: "Add ₹ 6540.0 or more",
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBar.appbar(context, "Payment Confirmation"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          priceCard(),
          SizedBox(height: appDimensions.horizontalSpaceS),
          quantitySelector(),
          SizedBox(height: appDimensions.horizontalSpaceS),
          purchaseSummary(),
          SizedBox(height: appDimensions.horizontalSpaceS),
          Center(
            child: Inter(
              text:
                  "Since the DMP differs on a daily basis, a Volatility margin of 2% is included in your trade value. Refund shall be processed after your order’s settlement.",
              color: AppColors.lightGrey,
              fontSize: appDimensions.fontXXS,
              textAlign: TextAlign.center,
            ),
          ).withPadHorizontal(appDimensions.horizontalPaddingS),
        ],
      ),
      bottomNavigationBar: bottomCTA(),
    );
  }
}
