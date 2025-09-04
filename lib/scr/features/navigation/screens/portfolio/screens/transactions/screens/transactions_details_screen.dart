import 'package:share_sampatti_mvp/app/app.dart';

class TransactionsDetailsScreen extends ConsumerWidget {
  const TransactionsDetailsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final transactionId = ref.watch(currentTransaction);
    final transaction = ref.watch(currentTransactionController(transactionId));

    return transaction.when(
      data: (data) {
        return Scaffold(
          appBar: CustomAppBar.appbar(
            context,
            "Transaction ${data.status.toLowerCase()}",
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Inter(
                text: "Buy from",
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w600,
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.check, color: Colors.white),
                ),
                title: Inter(
                  text: data.title,
                  fontSize: appDimensions.fontM,
                  fontWeight: FontWeight.w600,
                ),
                subtitle: Inter(
                  text: "XXXXXXXXXXX",
                  color: AppColors.lightGrey,
                  fontSize: appDimensions.fontXXS,
                ),
                trailing: Inter(
                  text: "₹${data.amount}",
                  color: AppColors.lightGreen,
                  fontSize: appDimensions.fontM,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: appDimensions.verticalSpaceS),
              Card(
                color: Theme.of(context).cardColor,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Banking Name",
                        style: TextStyle(color: Colors.grey[500], fontSize: 13),
                      ),
                      Text(
                        "transaction.senderName",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Card(
                color: Theme.of(context).cardColor,
                elevation: 0,
                child: ExpansionTile(
                  collapsedIconColor: Colors.purple[200],
                  iconColor: Colors.purple[200],
                  title: Text(
                    "Transfer Details",
                    style: TextStyle(color: Colors.white),
                  ),
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 4,
                      ),
                      title: Text(
                        "Transaction ID",
                        style: TextStyle(color: Colors.grey[400], fontSize: 13),
                      ),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: Text(
                              " transaction.transactionId",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.copy,
                              size: 16,
                              color: Colors.purple[200],
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 4,
                      ),
                      title: Text(
                        "Credited to",
                        style: TextStyle(color: Colors.grey[400], fontSize: 13),
                      ),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "transaction.creditedAccount   ₹transaction.amount",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 4,
                      ),
                      title: Text(
                        "UTR",
                        style: TextStyle(color: Colors.grey[400], fontSize: 13),
                      ),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "transaction.utr",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.copy,
                              size: 16,
                              color: Colors.purple[200],
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActionIcon(label: "Send Money", icon: Icons.arrow_forward),
                  ActionIcon(
                    label: "Check Balance",
                    icon: Icons.account_balance,
                  ),
                  ActionIcon(label: "View History", icon: Icons.history),
                  ActionIcon(label: "Share Receipt", icon: Icons.share),
                ],
              ),
              SizedBox(height: 22),
              Card(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  leading: Icon(Icons.chat_bubble, color: Colors.purple[200]),
                  title: Text(
                    "Contact Phone Support",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.purple[200],
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 22),
            ],
          ).withPadHorizontal(appDimensions.horizontalPaddingM),
        );
      },
      error: (error, stackTrace) => Inter(text: "Exception: $error"),
      loading: () =>
          Center(child: CircularProgressIndicator(color: AppColors.lightGreen)),
    );
  }
}

class ActionIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  const ActionIcon({required this.label, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple[400],
          child: Icon(icon, color: Colors.white, size: 22),
          radius: 24,
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 13)),
      ],
    );
  }
}
