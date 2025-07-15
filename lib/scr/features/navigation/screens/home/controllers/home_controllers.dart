import 'package:share_sampatti_mvp/app/app.dart';

final PropertyService _propertyService = PropertyService();

final propertyProvider = FutureProvider<List<PropertyModel>>(
  (ref) async => _propertyService.fetchProperty(),
);
