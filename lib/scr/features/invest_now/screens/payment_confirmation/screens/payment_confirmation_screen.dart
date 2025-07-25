import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class PaymentConfirmationScreen extends ConsumerStatefulWidget {
  const PaymentConfirmationScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<PaymentConfirmationScreen> createState() =>
      _PaymentConfirmationScreen();
}

class _PaymentConfirmationScreen
    extends ConsumerState<PaymentConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final currentPropertyProv = ref.watch(currentPropertyProvider(widget.id));
    final paymentState = ref.watch(paymentConfirmationProvider);
    final paymentController = ref.read(paymentConfirmationProvider.notifier);

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
                Container(
                  height: appDimensions.height * 0.05,
                  width: appDimensions.width * 0.2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(appDimensions.radiusS),
                  ),
                  child: Inter(
                    text: "${paymentState.sqftCount}",
                    fontSize: appDimensions.fontS,
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
        double tradeValue = paymentController.requiredAmount(
          data.pricePerToken,
        );
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
                  text: "₹ ${getPrice(data.pricePerToken)}",
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
                  onPressed: () async {
                    try {
                      final user = AuthPreference.getUserData();
                      final razorpay = ref.read(razorpayProvider(context));
                      await razorpay.createOrder(
                        userId: user!["id"],
                        propertyId: widget.id,
                        quantity: paymentState.sqftCount,
                        type: "BUY",
                      );

                      log("Initiate Razorpay");
                      razorpay.openCheckout(
                        name: user["fullName"],
                        email: user["email"] ?? "tempEmail",
                        phone: user["phoneNumber"],
                      );
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      CustomSnackBar.snackbar(context, e.toString());
                    }
                  },
                  text: "Add ₹ ${getPrice(totalAmount)} or more",
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
      },
      error: (e, _) => Center(child: Text('Invest Now Error: $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
