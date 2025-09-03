import 'package:intl/intl.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final transactions = ref.watch(transactionController);

    value(double money) {
      return NumberFormat.decimalPattern("en_IN").format(money);
    }

    return Scaffold(
      appBar: CustomAppBar.appbar(context, "Transactions"),
      body: transactions.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Inter(text: "No transactions", color: AppColors.lightGrey),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                ref.read(currentTransaction.notifier).state = data[index].id;
                context.push("/transactionsDetails");
              },
              child: Column(
                children: [
                  if (index != 0)
                    Divider(
                      color: AppColors.dividerColor,
                    ).withPadSymmetric(0, appDimensions.horizontalPaddingM),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.black,
                      backgroundImage: NetworkImage(data[index].image),
                    ),
                    title: Inter(text: data[index].title),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Inter(
                          text: "₹ ${value(data[index].amount)}",
                          fontSize: appDimensions.fontXXS,
                        ),
                        Inter(
                          text: "28.14%",
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: appDimensions.fontXXS,
                        ),
                        SizedBox(height: appDimensions.verticalSpaceXS),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: appDimensions.horizontalPaddingXS,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(
                              appDimensions.radiusXS,
                            ),
                          ),
                          child: Inter(
                            text: data[index].status,
                            color: (data[index].status == "SUCCESS")
                                ? Theme.of(context).colorScheme.primary
                                : (data[index].status == "PENDING")
                                ? Colors.amber
                                : AppColors.red,
                            fontSize: appDimensions.fontXXS,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ).withPadVertical(appDimensions.verticalPaddingXS),
                ],
              ),
            ),
          );
        },
        error: (Object error, StackTrace stackTrace) {
          return Inter(text: "Transaction Error -> $error");
        },
        loading: () => Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
