class PropertyModel {
  final String id;
  final String title;
  final List<dynamic> images;
  final double pricePerSqFt;
  final double pricePerToken;
  final double progressPercentage;
  final String? description;
  final String? propertyCategory;
  final String? propertyType;

  PropertyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.progressPercentage,
    required this.propertyCategory,
    required this.propertyType,
    required this.pricePerSqFt,
    required this.pricePerToken,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json["id"],
      title: json["title"],
      images: json["images"],
      pricePerSqFt: (json["PricePerSqFt"] as num).toDouble(),
      pricePerToken: (json["PricePerToken"] ?? 0.0 as num).toDouble(),
      progressPercentage: (json["progress_percentage"] ?? 0.0 as num)
          .toDouble(),
      description:
          json["description"] ??
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      propertyCategory: json["propertyCategory"] ?? "Residential",
      propertyType: json["propertyType"] ?? "Private Opportunity",
    );
  }
}
