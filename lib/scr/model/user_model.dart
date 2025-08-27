class UserModel {
  final String id;
  final String name;
  final String phone;
  final String? email;
  final bool? kycStatus;
  final List<String>? saveProperty;
  final double? netWorth;
  final String? profilePic;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    this.email,
    this.kycStatus,
    this.saveProperty,
    this.netWorth = 0,
    this.profilePic,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json["name"],
      phone: json["phoneNumber"],
    );
  }

  Map<String, dynamic> toJson() => {'name': name, 'phoneNumber': phone};
}
