// invest_now_controller.dart
import 'dart:developer';
import 'package:share_sampatti_mvp/app/app.dart';

class PaymentConfirmationState {
  final int sqftCount;
  PaymentConfirmationState({this.sqftCount = 1});

  PaymentConfirmationState copyWith({int? sqftCount}) =>
      PaymentConfirmationState(sqftCount: sqftCount ?? this.sqftCount);
}

class PaymentConfirmationController
    extends StateNotifier<PaymentConfirmationState> {
  PaymentConfirmationController() : super(PaymentConfirmationState());

  void increment() {
    state = state.copyWith(sqftCount: state.sqftCount + 1);
  }

  void decrement() {
    if (state.sqftCount > 1) {
      state = state.copyWith(sqftCount: state.sqftCount - 1);
    }
  }

  double requiredAmount(double pricePerSqft) => state.sqftCount * pricePerSqft;
}

final paymentConfirmationProvider =
    StateNotifierProvider<
      PaymentConfirmationController,
      PaymentConfirmationState
    >((ref) {
      return PaymentConfirmationController();
    });

class RazorpayService {
  final _baseService = BaseService();
  late Razorpay _razorpay;
  Map<String, dynamic>? orderData;

  Function(PaymentSuccessResponse)? onPaymentSuccess;
  Function(PaymentFailureResponse)? onPaymentFailed;
  Function(ExternalWalletResponse)? onExternalWallet;

  RazorpayService({
    this.onPaymentSuccess,
    this.onPaymentFailed,
    this.onExternalWallet,
  }) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> createOrder({
    required String userId,
    required String propertyId,
    required int quantity,
    required String type,
  }) async {
    final data = {
      "userId": userId,
      "propertyId": propertyId,
      "quantity": quantity,
      "type": type,
    };
    log(data.toString());
    final response = await _baseService.post(
      url: ApiRoutes.createOrder,
      data: data,
    );
    log(response.data.toString());
    orderData = response.data;
  }

  void openCheckout({
    required String name,
    required String email,
    required String phone,
  }) {
    log("Option calling...");
    var options = {
      'key': orderData!["key"],
      'amount': orderData!["amount"] * 100,
      'name': name,
      'description': "Your payment description",
      'order_id': orderData!["razorpayOrderId"],
      'prefill': {'contact': phone, 'email': email},
      'external': {
        'wallets': ['paytm'],
      },
    };

    log("Option ending...");
    try {
      _razorpay.open(options);
    } catch (e) {
      log("Razorpay Error: $e");
    }
  }

  _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log("Payment Success: ${response.paymentId}");
    try {
      await _baseService.post(
        url: ApiRoutes.verifyOrder,
        data: {
          "transactionId": orderData!["transactionId"],
          "razorpay_payment_id": response.paymentId,
          "razorpay_order_id": response.orderId,
          "razorpay_signature": response.signature,
        },
      );
    } catch (e) {
      log("error at razorpay verification");
    }
    onPaymentSuccess?.call(response);
  }

  _handlePaymentError(PaymentFailureResponse response) {
    log("Payment Error: ${response.code} | ${response.message}");
    onPaymentFailed?.call(response);
  }

  _handleExternalWallet(ExternalWalletResponse response) {
    log("Payment Waller: ${response.walletName}");
    onExternalWallet?.call(response);
  }

  void dispose() {
    _razorpay.clear();
  }
}

final razorpayProvider = Provider.family<RazorpayService, BuildContext>((
  ref,
  context,
) {
  final service = RazorpayService(
    onPaymentSuccess: (val) => CustomSnackBar.snackbar(
      context,
      "Payment Successful",
      color: AppColors.lightGreen,
    ),
    onPaymentFailed: (val) =>
        CustomSnackBar.snackbar(context, "Payment Failed"),
    onExternalWallet: (val) => CustomSnackBar.snackbar(
      context,
      "External Wallet selected",
      color: AppColors.profileBackground,
    ),
  );
  ref.onDispose(() {
    service.dispose();
  });

  return service;
});
