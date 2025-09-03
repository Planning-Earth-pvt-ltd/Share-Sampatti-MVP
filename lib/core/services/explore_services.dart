import 'dart:developer';

import 'package:share_sampatti_mvp/app/app.dart';

class ExploreServices {
  final _baseService = BaseService();
  Future<List<PropertyModel>> fetchExploredProperty({
    String? category,
    String? state,
  }) async {
    final query = {
      if (category != null) "category": category,
      if (state != null) "state": state,
    };
    log("Check query: $query");
    final response = await _baseService.get(
      url: ApiRoutes.filter,
      query: query,
    );

    try {
      log(response.data.toString());
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => PropertyModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to fetch property: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
