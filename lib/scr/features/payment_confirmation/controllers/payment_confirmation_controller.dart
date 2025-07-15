// invest_now_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentConfirmationState {
  final int sqftCount;
  PaymentConfirmationState({this.sqftCount = 1});

  PaymentConfirmationState copyWith({int? sqftCount}) =>
      PaymentConfirmationState(sqftCount: sqftCount ?? this.sqftCount);
}

class PaymentConfirmationController
    extends StateNotifier<PaymentConfirmationState> {
  PaymentConfirmationController() : super(PaymentConfirmationState());

  final double pricePerSqft = 6540.0;

  void increment() {
    state = state.copyWith(sqftCount: state.sqftCount + 1);
  }

  void decrement() {
    if (state.sqftCount > 1) {
      state = state.copyWith(sqftCount: state.sqftCount - 1);
    }
  }

  double get requiredAmount => state.sqftCount * pricePerSqft;
}

final paymentConfirmationProvider =
    StateNotifierProvider<
      PaymentConfirmationController,
      PaymentConfirmationState
    >((ref) {
      return PaymentConfirmationController();
    });
