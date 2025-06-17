class UserModel {
  final String id;
  final String name;
  final String phone;

  UserModel({required this.id, required this.name, required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json["name"],
      phone: json["phoneNumber"],
    );
  }
}
