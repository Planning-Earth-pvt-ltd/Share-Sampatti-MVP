import 'dart:developer';

import 'package:share_sampatti_mvp/core/core.dart';
import 'package:share_sampatti_mvp/scr/model/property_model.dart';

class PropertyService {
  final BaseService _baseService = BaseService();

  Future<List<PropertyModel>> fetchProperty() async {
    final response = await _baseService.get(ApiRoutes.property);

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
