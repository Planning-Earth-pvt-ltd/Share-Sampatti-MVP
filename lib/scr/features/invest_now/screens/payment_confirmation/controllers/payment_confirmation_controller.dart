// invest_now_controller.dart
import 'dart:developer';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/scr/providers/user_controller.dart';
import 'package:share_sampatti_mvp/scr/providers/transaction_controller.dart';

class PaymentConfirmationState {
  final int sqftCount;
  final TextEditingController sqftController;
  PaymentConfirmationState({
    this.sqftCount = 1,
    TextEditingController? sqftController,
  }) : sqftController = sqftController ?? TextEditingController(text: "1");

  PaymentConfirmationState copyWith({
    int? sqftCount,
    TextEditingController? sqftController,
  }) => PaymentConfirmationState(
    sqftCount: sqftCount ?? this.sqftCount,
    sqftController: sqftController ?? this.sqftController,
  );
}

class PaymentConfirmationController
    extends StateNotifier<PaymentConfirmationState> {
  PaymentConfirmationController() : super(PaymentConfirmationState());

  void increment() {
    final newCount = state.sqftCount + 1;
    state.sqftController.text = newCount.toString();
    state = state.copyWith(sqftCount: newCount);
  }

  void decrement() {
    if (state.sqftCount > 1) {
      final newCount = state.sqftCount - 1;
      state.sqftController.text = newCount.toString();
      state = state.copyWith(sqftCount: newCount);
    }
  }

  void updateSqftFromText(String value) {
    final parsedValue = int.tryParse(value);
    if (parsedValue != null && parsedValue > 0) {
      state = state.copyWith(sqftCount: parsedValue);
    }
  }

  double requiredAmount(double pricePerSqft) => state.sqftCount * pricePerSqft;

  @override
  void dispose() {
    state.sqftController.dispose();
    super.dispose();
  }
}

final paymentConfirmationProvider =
    StateNotifierProvider<
      PaymentConfirmationController,
      PaymentConfirmationState
    >((ref) {
      return PaymentConfirmationController();
    });

class RazorpayService {
  late Razorpay _razorpay;
  final Ref _ref;

  RazorpayService(this._ref) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> startPayment({
    required double amount,
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      final user = _ref.read(userProvider);
      final paymentService = _ref.read(paymentServiceProvider);

      final orderResp = await paymentService.createOrder(
        amount: amount,
        notes: {if (user != null) 'userId': user.id, 'amount': amount},
      );

      final String orderId = (orderResp['orderId'] ?? orderResp['id'] ?? '')
          .toString();
      if (orderId.isEmpty) throw Exception('Invalid orderId from server');

      final options = {
        'key': 'rzp_test_WLQaPDCwKewx0p',
        'amount': amount * 100,
        'name': name,
        'order_id': orderId,
        'description': 'Investment Payment',
        'prefill': {'contact': phone, 'email': email},
        'external': {
          'wallets': ['paytm'],
        },
        'notes': {if (user != null) 'userId': user.id},
      };

      _razorpay.open(options);
    } catch (e) {
      log('startPayment error: $e');
    }
  }

  void openCheckout({
    required double amount,
    required String name,
    required String email,
    required String phone,
  }) {
    var options = {
      'key': "rzp_test_WLQaPDCwKewx0p",
      'amount': amount * 100,
      'name': name,
      'description': "Your payment description",
      'prefill': {'contact': phone, 'email': email},
      'external': {
        'wallets': ['paytm'],
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      log("Razorpay Error: $e");
    }
  }

  _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log("Payment Success: ${response.paymentId}");
    final user = _ref.read(userProvider);
    if (user != null) {
      _ref.invalidate(transactionsProvider(user.id));
    }

    try {
      final paymentService = _ref.read(paymentServiceProvider);
      final orderId = response.orderId ?? '';
      final paymentId = response.paymentId ?? '';
      final signature = response.signature ?? '';
      if (orderId.isNotEmpty && paymentId.isNotEmpty && signature.isNotEmpty) {
        await paymentService.verifyPayment(
          orderId: orderId,
          paymentId: paymentId,
          signature: signature,
          extra: {if (user != null) 'userId': user.id},
        );
      }
    } catch (e) {
      log('verifyPayment error: $e');
    }
  }

  _handlePaymentError(PaymentFailureResponse response) {
    log("Payment Error: ${response.code} | ${response.message}");
  }

  _handleExternalWallet(ExternalWalletResponse response) {
    log("Payment Waller: ${response.walletName}");
  }

  void dispose() {
    _razorpay.clear();
  }
}

final razorpayProvider = Provider.autoDispose<RazorpayService>((ref) {
  final service = RazorpayService(ref);
  ref.onDispose(() {
    service.dispose();
  });

  return service;
});
