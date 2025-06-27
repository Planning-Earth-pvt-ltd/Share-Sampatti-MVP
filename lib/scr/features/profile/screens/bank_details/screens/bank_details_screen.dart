import 'package:share_sampatti_mvp/app/app.dart';

class BankDetailsScreen extends ConsumerWidget {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);

    buildHeadingText(String text) {
      return Inter(
        text: text,
        color: AppColors.lightGrey,
        fontSize: appDimensions.fontS,
        fontWeight: FontWeight.w600,
      );
    }

    buildBody(String text) {
      return Inter(
        text: text,
        color: AppColors.grey,
        fontSize: appDimensions.fontXS,
        fontWeight: FontWeight.w600,
      );
    }

    return Scaffold(
      appBar: CustomAppBar.appbar(context, "Bank Details"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeadingText("Account Holder Name"),
          buildBody("Shubham Patel"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: appDimensions.verticalSpaceM),

          buildHeadingText("Account Number"),
          buildBody("XXXX XXXX XXXX 5678"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: appDimensions.verticalSpaceM),

          buildHeadingText("IFSC Code"),
          buildBody("HDFC000001234"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: appDimensions.verticalSpaceM),

          buildHeadingText("Account Type"),
          buildBody("Savings"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: appDimensions.verticalSpaceM),

          CustomElevatedButton(
            onPressed: () => context.push("/enterBankDetails"),
            text: "Add Bank Account",
          ),
        ],
      ).withPadAll(appDimensions.horizontalPaddingM),
    );
  }
}
