class TransactionModel {
  final String id;
  final String userId;
  final String? propertyId;
  final String type; // e.g., buy, sell, dividend, fee
  final double amount;
  final DateTime createdAt;
  final String? description;

  TransactionModel({
    required this.id,
    required this.userId,
    this.propertyId,
    required this.type,
    required this.amount,
    required this.createdAt,
    this.description,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      userId: json['userId']?.toString() ?? '',
      propertyId: json['propertyId']?.toString(),
      type: json['type']?.toString() ?? 'unknown',
      amount: (json['amount'] is int)
          ? (json['amount'] as int).toDouble()
          : (json['amount'] as num?)?.toDouble() ?? 0.0,
      createdAt:
          DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(
            (json['createdAt'] is int) ? json['createdAt'] : 0,
            isUtc: true,
          ),
      description: json['description']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      if (propertyId != null) 'propertyId': propertyId,
      'type': type,
      'amount': amount,
      'createdAt': createdAt.toIso8601String(),
      if (description != null) 'description': description,
    };
  }
}
