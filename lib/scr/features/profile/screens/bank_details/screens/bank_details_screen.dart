import 'package:share_sampatti_mvp/app/app.dart';

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    buildBody(String text) {
      return Inter(
        text: text,
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
    }

    return Scaffold(
      appBar: CustomAppBar.appbar(context, "Bank Details"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.buildHeadingText("Account Holder Name"),
          buildBody("Shubham Patel"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: size.height * 0.03),

          CustomText.buildHeadingText("Account Number"),
          buildBody("XXXX XXXX XXXX 5678"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: size.height * 0.03),

          CustomText.buildHeadingText("IFSC Code"),
          buildBody("HDFC000001234"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: size.height * 0.03),

          CustomText.buildHeadingText("Account Type"),
          buildBody("Savings"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: size.width * 0.2),

          CustomElevatedButton(
            onPressed: () => context.push("/enterBankDetails"),
            text: "Add Bank Account",
          ),
        ],
      ).withPadAll(size.width * 0.05),
    );
  }
}
