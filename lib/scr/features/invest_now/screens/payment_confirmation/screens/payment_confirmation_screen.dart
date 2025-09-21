import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/scr/providers/user_controller.dart';

class PaymentConfirmationScreen extends ConsumerWidget {
  PaymentConfirmationScreen({super.key, required this.id});
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final currentPropertyProv = ref.watch(currentPropertyProvider(id));
    final paymentState = ref.watch(paymentConfirmationProvider);
    final paymentController = ref.read(paymentConfirmationProvider.notifier);

    // Add listener to update state when text changes
    paymentState.sqftController.addListener(() {
      paymentController.updateSqftFromText(paymentState.sqftController.text);
    });

    getPrice(double value) =>
        NumberFormat.decimalPattern("en_IN").format(value);

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
                  onPressed: paymentController.decrement,
                  icon: Icon(
                    Icons.remove,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(
                  width: appDimensions.width * 0.2,
                  child: CustomTextField(
                    controller: paymentState.sqftController,
                    keyboardType: TextInputType.number,
                    radius: appDimensions.radiusS,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  onPressed: paymentController.increment,
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

    return currentPropertyProv.when(
      data: (data) {
        double tradeValue = paymentController.requiredAmount(data.pricePerSqFt);
        double fees = 110.0;
        double margin = tradeValue * 0.02;
        double totalAmount = tradeValue + fees + margin;

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
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
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
                  text: "₹ ${getPrice(data.pricePerSqFt)}",
                  fontSize: appDimensions.fontM,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
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
                    rowItem('Trade Value', '₹ ${getPrice(tradeValue)}'),
                    rowItem('Fees & Other Leives', '₹ ${getPrice(fees)}'),
                    rowItem('Volatility Margin', '₹ ${getPrice(margin)}'),
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
                        Inter(
                          text: "₹ ${getPrice(totalAmount)}",
                          fontSize: appDimensions.fontL,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: appDimensions.verticalSpaceM),
                CustomElevatedButton(
                  onPressed: () {
                    final razorpay = ref.read(razorpayProvider);
                    final user = ref.read(userProvider);
                    log("Initiate Razorpay");
                    razorpay.openCheckout(
                      amount: num.parse(
                        totalAmount.toStringAsFixed(2),
                      ).toDouble(),
                      name: user?.name ?? "User",
                      email: user?.email ?? "test@gmail.com",
                      phone: user?.phone ?? "9876543210",
                    );
                  },
                  text: "Add ₹ ${getPrice(totalAmount)} or more",
                ),
              ],
            ),
          );
        }

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: CustomAppBar.appbar(context, "Payment Confirmation"),
            body: Form(
              key: _key,
              child: Column(
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
            ),
            bottomNavigationBar: bottomCTA(),
          ),
        );
      },
      error: (e, _) => Center(child: Text('Invest Now Error: $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
