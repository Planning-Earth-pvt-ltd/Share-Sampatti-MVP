import 'package:share_sampatti_mvp/app/app.dart';

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    buildHeading(String text) {
      return Inter(
        text: text,
        color: AppColors.lightGrey,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );
    }

    buildBody(String text) {
      return Inter(
        text: text,
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_sharp),
          color: AppColors.lightGrey,
        ),
        title: Text("Bank Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeading("Account Holder Name"),
          buildBody("Demo Gupta"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: size.height * 0.03),

          buildHeading("Account Number"),
          buildBody("XXXX XXXX XXXX 5678"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: size.height * 0.03),

          buildHeading("IFSC Code"),
          buildBody("HDFC000001234"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: size.height * 0.03),

          buildHeading("Account Type"),
          buildBody("Savings"),
          Divider(thickness: 2, color: AppColors.dividerColor),
          SizedBox(height: size.width * 0.2),

          CustomElevatedButton(
            onPressed: () => context.push("/enterBankDetails"),
            text: "Add Bank Account",
            textColor: AppColors.black,
          ),
        ],
      ).withPadAll(size.width * 0.05),
    );
  }
}
