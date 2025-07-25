import 'dart:developer';

import 'package:share_sampatti_mvp/app/app.dart';

final _baseService = BaseService();

// Future<List<PropertyModel>> fetchTransactions() async {
//   final response = await _baseService.get(url: ApiRoutes.getTransactions);

//   try {
//     log(response.data.toString());
//     if (response.statusCode == 200) {
//       final List<dynamic> data = response.data;
//       return data.map((json) => TransactionsModel.fromJson(json)).toList();
//     } else {
//       throw Exception("Failed to fetch property: ${response.statusCode}");
//     }
//   } catch (e) {
//     rethrow;
//   }
// }
