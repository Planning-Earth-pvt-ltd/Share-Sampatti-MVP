import 'dart:developer';

import 'package:share_sampatti_mvp/app/app.dart';

class TransactionService {
  final BaseService _baseService = BaseService();

  Future<List<TransactionModel>> fetchUserTransactions(String userId) async {
    final String url = "${ApiRoutes.transactions}/$userId";
    final response = await _baseService.get(url: url);

    try {
      log("[transactions] status: ${response.statusCode}");
      if (response.statusCode == 200) {
        final dynamic data = response.data;

        if (data is List) {
          return data
              .map(
                (json) =>
                    TransactionModel.fromJson(json as Map<String, dynamic>),
              )
              .toList();
        }

        if (data is Map<String, dynamic>) {
          final dynamic list =
              data['transactions'] ?? data['data'] ?? data['items'];
          if (list is List) {
            return list
                .map(
                  (json) =>
                      TransactionModel.fromJson(json as Map<String, dynamic>),
                )
                .toList();
          }
        }

        return <TransactionModel>[];
      } else {
        throw Exception("Failed to fetch transactions: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
