import 'package:share_sampatti_mvp/app/app.dart';

final _transactionService = TransactionsServices();
final transactionController = FutureProvider<List<TransactionsModel>>(
  (ref) async => _transactionService.fetchTransactions(),
);
