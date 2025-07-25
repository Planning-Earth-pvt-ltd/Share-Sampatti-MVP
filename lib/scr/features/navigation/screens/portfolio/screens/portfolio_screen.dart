import 'dart:ffi';
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class PortfolioScreen extends ConsumerWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final transactions = ref.watch(transactionController);
    final user = ref.watch(userProvider);

    value(double money) {
      return NumberFormat.decimalPattern("en_IN").format(money);
    }

    // balanceCard() {
    //   return Container(
    //     width: appDimensions.width,
    //     margin: EdgeInsets.symmetric(
    //       horizontal: appDimensions.horizontalPaddingM,
    //       vertical: appDimensions.verticalPaddingS,
    //     ),
    //     padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
    //     decoration: BoxDecoration(
    //       color: AppColors.darkGrey,
    //       borderRadius: BorderRadius.circular(appDimensions.radiusM),
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Inter(text: "SHUBHAM PATEL", fontSize: appDimensions.fontS),
    //         SizedBox(height: appDimensions.verticalSpaceS),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             ...List.generate(
    //               3,
    //               (index) => Inter(
    //                 text: "****",
    //                 fontSize: appDimensions.fontL,
    //                 fontWeight: FontWeight.w600,
    //               ),
    //             ),
    //             Inter(
    //               text: "7423",
    //               fontSize: appDimensions.fontL,
    //               fontWeight: FontWeight.w600,
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: appDimensions.verticalSpaceL),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //             Inter(text: "BALANCE", color: AppColors.lightGrey),
    //             Inter(
    //               text: "₹ 2,40,655",
    //               fontSize: appDimensions.fontM,
    //               color: Theme.of(context).colorScheme.primary,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   );
    // }

    balanceCard() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: appDimensions.verticalPaddingS),
        padding: EdgeInsets.symmetric(
          horizontal: appDimensions.horizontalPaddingM,
          vertical: appDimensions.verticalPaddingXS,
        ),
        width: appDimensions.width,
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          border: Border(
            bottom: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          borderRadius: BorderRadius.circular(appDimensions.radiusM),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Inter(
              text: "Current Value",
              fontWeight: FontWeight.w500,
              color: AppColors.lightGrey,
            ),
            SizedBox(height: appDimensions.verticalSpaceS),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Inter(
                  text: "₹ ${value(user.netWorth!)}",
                  fontSize: appDimensions.fontL,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: appDimensions.horizontalSpaceS),
                Inter(
                  text: "31.04%",
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: appDimensions.fontXXS,
                ),
              ],
            ),
          ],
        ),
      );
    }

    returnSection() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Inter(
                text: "Portfolio",
                color: AppColors.lightGrey,
                fontSize: appDimensions.fontXXS,
              ),
              Inter(
                text: "Current Value",
                color: AppColors.lightGrey,
                fontSize: appDimensions.fontXXS,
              ),
            ],
          ),
          SizedBox(height: appDimensions.verticalPaddingXS),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Inter(
                    text: "₹ 2.13L",
                    fontSize: appDimensions.fontM,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(width: appDimensions.horizontalSpaceXS),
                  Inter(
                    text: "25.94%",
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: appDimensions.fontXXS,
                  ),
                ],
              ),
              Inter(
                text: "All Time Returns",
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ).withPadSymmetric(
        appDimensions.verticalPaddingXS,
        appDimensions.horizontalPaddingM,
      );
    }

    propertyList() {
      return transactions.when(
        data: (data) {
          if (data.isEmpty) {
            return Expanded(
              child: Center(
                child: Inter(
                  text: "No transactions",
                  color: AppColors.lightGrey,
                ),
              ),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: min(data.length, 5),
            itemBuilder: (context, index) => Column(
              children: [
                if (index != 0)
                  Divider(
                    color: AppColors.dividerColor,
                  ).withPadSymmetric(0, appDimensions.horizontalPaddingM),
                ListTile(
                  leading: CircleAvatar(
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
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Inter(
            text: "Portfolio",
            fontSize: appDimensions.fontL,
            fontWeight: FontWeight.w600,
          ).withPadAllCustom(
            appDimensions.horizontalPaddingM,
            0,
            appDimensions.horizontalPaddingM,
            appDimensions.horizontalPaddingM,
          ),
          balanceCard(),
          Divider(
            color: AppColors.dividerColor,
            thickness: 2,
          ).withPadSymmetric(0, appDimensions.horizontalPaddingM),
          returnSection(),
          Divider(
            color: AppColors.dividerColor,
            thickness: 2,
          ).withPadSymmetric(0, appDimensions.horizontalPaddingM),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Inter(
                text: "Transactions",
                fontSize: appDimensions.fontL,
                fontWeight: FontWeight.w500,
              ),
              CustomElevatedButton(
                onPressed: () => context.push("/transactions"),
                text: "View All",
                width: 72,
                height: 25,
                radius: 6,
                fontSize: 12,
              ),
            ],
          ).withPadHorizontal(appDimensions.horizontalPaddingM),
          propertyList(),
        ],
      ),
    );
  }
}
