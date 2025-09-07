import 'dart:developer';

import 'package:share_sampatti_mvp/app/app.dart';

final paymentServiceProvider = Provider<PaymentService>(
  (ref) => PaymentService(),
);

class PaymentService {
  final BaseService _baseService = BaseService();

  Future<Map<String, dynamic>> createOrder({
    required double amount,
    Map<String, dynamic>? notes,
  }) async {
    final data = <String, dynamic>{
      'amount': amount,
      if (notes != null) 'notes': notes,
    };

    final response = await _baseService.post(
      url: ApiRoutes.paymentCreateOrder,
      data: data,
    );

    if (response.statusCode == 200) {
      final dynamic body = response.data;
      if (body is Map<String, dynamic>) return body;
      log('[PaymentService] Unexpected createOrder response: ${response.data}');
      return {'orderId': body.toString()};
    } else {
      throw Exception('Failed to create order: ${response.statusCode}');
    }
  }

  Future<bool> verifyPayment({
    required String orderId,
    required String paymentId,
    required String signature,
    Map<String, dynamic>? extra,
  }) async {
    final data = <String, dynamic>{
      'orderId': orderId,
      'paymentId': paymentId,
      'signature': signature,
      if (extra != null) ...extra,
    };

    final response = await _baseService.post(
      url: ApiRoutes.paymentVerify,
      data: data,
    );

    if (response.statusCode == 200) {
      final dynamic body = response.data;
      if (body is Map<String, dynamic>) {
        final success = body['success'];
        return success == true;
      }
      return true;
    } else {
      throw Exception('Failed to verify payment: ${response.statusCode}');
    }
  }
}
