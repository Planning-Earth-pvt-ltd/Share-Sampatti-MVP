class PropertyModel {
  final String id;
  final String title;
  final String description;
  final String address;
  final String city;
  final String state;
  final String propertyCategory;
  final String propertyType;
  final List<dynamic> images;
  final int currentValuation;

  PropertyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.city,
    required this.state,
    required this.propertyCategory,
    required this.propertyType,
    required this.images,
    required this.currentValuation,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      address: json["address"],
      city: json["city"],
      state: json["state"],
      propertyCategory: json["propertyCategory"],
      propertyType: json["propertyType"],
      images: json["images"],
      currentValuation: json["currentValuation"],
    );
  }
}
