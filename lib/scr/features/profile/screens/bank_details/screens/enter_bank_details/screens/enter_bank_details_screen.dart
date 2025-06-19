import 'package:share_sampatti_mvp/app/app.dart';

class EnterBankDetailsScreen extends ConsumerStatefulWidget {
  const EnterBankDetailsScreen({super.key});

  @override
  ConsumerState<EnterBankDetailsScreen> createState() =>
      _EnterBankDetailsScreenState();
}

class _EnterBankDetailsScreenState
    extends ConsumerState<EnterBankDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _currentValue;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Map<String, TextEditingController> controller = ref.watch(
      bankProvider,
    );

    buildHeading(String text) {
      return Inter(
        text: text,
        color: AppColors.lightGrey,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );
    }

    OutlineInputBorder border(Color color) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 2),
        borderRadius: BorderRadius.circular(10),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back_sharp),
            color: AppColors.lightGrey,
          ),
          title: Text("Enter Your Bank Details"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeading("Account Holder Name"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: controller["name"]!,
                  hintText: 'Demo Gupta',
                  // validator: nameValidator,
                ),
                SizedBox(height: size.height * 0.03),

                buildHeading("Account Number"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: controller["accountNumber"]!,
                  hintText: 'XXXX XXXX XXXX 5748',
                  // validator: mobileValidator,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: size.height * 0.03),

                buildHeading("Confirm Account Number"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: controller["confirmAccountNumber"]!,
                  hintText: 'XXXX XXXX XXXX 5748',
                  // validator: mobileValidator,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: size.height * 0.03),

                buildHeading("IFSC Code"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: controller["ifscCode"]!,
                  hintText: 'HDFC000001234',
                  // validator: mobileValidator,
                ),
                SizedBox(height: size.height * 0.03),

                buildHeading("Account Type"),
                SizedBox(height: size.width * 0.02),
                DropdownButtonFormField<String>(
                  value: _currentValue,
                  hint: Inter(
                    text: "Select Account Type",
                    color: AppColors.grey,
                    fontSize: 16,
                  ),
                  style: TextStyle(fontFamily: "Inter", fontSize: 16),
                  onChanged: (newValue) {
                    _currentValue = newValue!;
                  },
                  items: AppConstants.bankDetails
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  // validator: validator,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.darkGrey,
                    enabledBorder: border(AppColors.darkGrey),
                    focusedBorder: border(
                      Theme.of(context).colorScheme.primary,
                    ),
                    errorBorder: border(AppColors.red),
                    focusedErrorBorder: border(AppColors.red),
                    disabledBorder: border(AppColors.black),
                  ),
                ),
                SizedBox(height: size.width * 0.2),

                CustomElevatedButton(
                  onPressed: () {},
                  text: "Save",
                  textColor: AppColors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
