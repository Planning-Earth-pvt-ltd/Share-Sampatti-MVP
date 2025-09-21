import 'dart:developer';

import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/scr/providers/user_controller.dart';
import 'package:share_sampatti_mvp/scr/providers/transaction_controller.dart';
import 'package:intl/intl.dart';

class PortfolioScreen extends ConsumerWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChartView = ref.watch(viewToggleProvider);
    final appDimensions = ref.watch(appDimensionsProvider);
    final user = ref.watch(userProvider);

    balanceCard() {
      return Container(
        width: appDimensions.width,
        margin: EdgeInsets.symmetric(
          horizontal: appDimensions.horizontalPaddingM,
          vertical: appDimensions.verticalPaddingS,
        ),
        padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(appDimensions.radiusM),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Inter(text: "${user?.name}", fontSize: appDimensions.fontS),
            SizedBox(height: appDimensions.verticalSpaceS),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  3,
                  (index) => Inter(
                    text: "****",
                    fontSize: appDimensions.fontL,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Inter(
                  text: "7423",
                  fontSize: appDimensions.fontL,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: appDimensions.verticalSpaceL),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Inter(text: "BALANCE", color: AppColors.lightGrey),
                Inter(
                  text: "₹ ${user?.netWorth}",
                  fontSize: appDimensions.fontM,
                  color: Theme.of(context).colorScheme.primary,
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
                  Inter(text: "₹ 2.13L", fontSize: appDimensions.fontM),
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
      final String userId = user?.id ?? '';
      log(userId);
      final transactionsAsync = ref.watch(transactionsProvider(userId));

      return transactionsAsync.when(
        loading: () => Padding(
          padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
          child: const Center(child: CircularProgressIndicator()),
        ),
        error: (e, _) => Padding(
          padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
          child: Inter(
            text: e.toString(),
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        data: (transactions) {
          if (transactions.isEmpty) {
            return SizedBox.shrink();
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final t = transactions[index];
              return Column(
                children: [
                  if (index != 0)
                    Divider(
                      color: AppColors.dividerColor,
                    ).withPadSymmetric(0, appDimensions.horizontalPaddingM),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(AppAssets.investNowProperty),
                    ),
                    title: Inter(text: t.description ?? t.type),
                    subtitle: Inter(
                      text: DateFormat('dd MMM yyyy').format(t.createdAt),
                      color: AppColors.lightGrey,
                      fontSize: appDimensions.fontXXS,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Inter(
                          text: "₹ ${t.amount.toStringAsFixed(2)}",
                          fontSize: appDimensions.fontXXS,
                        ),
                        Inter(
                          text: t.type,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: appDimensions.fontXXS,
                        ),
                      ],
                    ),
                  ).withPadVertical(appDimensions.verticalPaddingXS),
                ],
              );
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: CustomAppBar.appbar(context, "Portfolio"),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            propertyList(),
          ],
        ),
      ),
    );
  }
}
