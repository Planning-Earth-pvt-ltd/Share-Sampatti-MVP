import 'dart:developer';

import 'package:share_sampatti_mvp/app/app.dart';

class TransactionsServices {
  final _baseService = BaseService();
  Future<List<TransactionsModel>> fetchTransactions() async {
    final user = AuthPreference.getUserData();
    final response = await _baseService.get(
      url: "${ApiRoutes.getTransactions}/${user!["id"]}",
    );

    try {
      log(response.data.toString());
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((json) => TransactionsModel.fromJson(json))
            .toList()
            .reversed
            .toList();
      } else {
        throw Exception("Failed to fetch property: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TransactionsModel> fetchCurrentTransactions(String id) async {
    final response = await _baseService.get(
      url: "${ApiRoutes.transactions}/$id",
    );

    try {
      log(response.data.toString());
      if (response.statusCode == 200) {
        final data = response.data;
        return TransactionsModel.fromJson(data);
      } else {
        throw Exception("Failed to fetch property: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
