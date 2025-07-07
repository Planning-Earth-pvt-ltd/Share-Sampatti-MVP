import 'package:share_sampatti_mvp/core/config/app_packages.dart';
import 'package:share_sampatti_mvp/core/services/property_service.dart';
import 'package:share_sampatti_mvp/scr/model/property_model.dart';

final PropertyService _propertyService = PropertyService();

final homeProvider = FutureProvider<List<PropertyModel>>(
  (ref) async => _propertyService.fetchProperty(),
);
