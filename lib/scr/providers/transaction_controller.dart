import 'package:share_sampatti_mvp/app/app.dart';

final transactionsProvider = FutureProvider.family
    .autoDispose<List<TransactionModel>, String>((ref, userId) async {
      if (userId.isEmpty) return <TransactionModel>[];
      final service = TransactionService();
      return service.fetchUserTransactions(userId);
    });
