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
    final appDimensions = ref.watch(appDimensionsProvider);

    // CONTROLLERS
    final Map<String, TextEditingController> profileController = ref.watch(
      profileProvider,
    );
    final Map<String, TextEditingController> bankController = ref.watch(
      bankProvider,
    );

    // VALIDATORS
    final nameValidator = ref.watch(nameValidatorProvider);

    OutlineInputBorder border(Color color) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 2),
        borderRadius: BorderRadius.circular(
          appDimensions.radiusMedium(context),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar.appbar(context, "Enter Your Bank Details"),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ACCOUNT HOLDER NAME
                CustomText.buildHeadingText("Account Holder Name"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: profileController["name"]!,
                  hintText: 'Ravi Gupta',
                  validator: nameValidator,
                ),
                SizedBox(height: size.height * 0.03),

                // ACCOUNT NUMBER
                CustomText.buildHeadingText("Account Number"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: bankController["accountNumber"]!,
                  hintText: 'XXXX XXXX XXXX 5748',
                  // validator: accountNumberValidator,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: size.height * 0.03),

                // CONFIRM ACCOUNT NUMBER
                CustomText.buildHeadingText("Confirm Account Number"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: bankController["confirmAccountNumber"]!,
                  hintText: 'XXXX XXXX XXXX 5748',
                  // validator: confirmAccountNumberValidator,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: size.height * 0.03),

                // IFSC CODE
                CustomText.buildHeadingText("IFSC Code"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: bankController["ifscCode"]!,
                  hintText: 'HDFC000001234',
                  // validator: ifscValidator,
                ),
                SizedBox(height: size.height * 0.03),

                // ACCOUNT TYPE
                CustomText.buildHeadingText("Account Type"),
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
                  // validator: accountTypeValidator,
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

                // SAVE BUTTON
                CustomElevatedButton(onPressed: () {}, text: "Save"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
