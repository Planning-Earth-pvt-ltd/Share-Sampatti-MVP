// invest_now_controller.dart
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
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
  late Razorpay _razorpay;

  RazorpayService() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
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

  _handlePaymentSuccess(PaymentSuccessResponse response) {
    log("Payment Success: ${response.paymentId}");
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

final razorpayProvider = Provider<RazorpayService>((ref) {
  final service = RazorpayService();
  ref.onDispose(() {
    service.dispose();
  });

  return service;
});
