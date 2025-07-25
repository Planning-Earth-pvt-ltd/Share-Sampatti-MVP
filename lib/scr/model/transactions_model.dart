class TransactionsModel {
  final String id;
  final String propertyId;
  final String image;
  final String title;
  final double amount;
  final String status;

  TransactionsModel({
    required this.id,
    required this.propertyId,
    required this.image,
    required this.title,
    required this.amount,
    required this.status,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      id: json["id"],
      propertyId: json["propertyId"],
      image: json["property"]["images"][0],
      title: json["property"]["title"],
      amount: double.parse(json["amount"]) * 0.01,
      status: json["status"],
    );
  }
}
