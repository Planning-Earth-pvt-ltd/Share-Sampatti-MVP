class UserModel {
  final String id;
  final String fullName;
  final String phone;
  final String? email;
  final bool? kycStatus;
  final List<String>? saveProperty;
  final double? netWorth;
  final String? profilePic;

  UserModel({
    required this.id,
    required this.fullName,
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
      fullName: json["fullName"],
      phone: json["phoneNumber"],
    );
  }

  Map<String, dynamic> toJson() => {'name': fullName, 'phoneNumber': phone};
}
