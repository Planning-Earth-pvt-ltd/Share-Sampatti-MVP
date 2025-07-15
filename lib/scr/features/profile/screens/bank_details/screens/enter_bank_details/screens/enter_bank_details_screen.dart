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

    buildHeadingText(String text) {
      return Inter(
        text: text,
        color: AppColors.lightGrey,
        fontSize: appDimensions.fontS,
        fontWeight: FontWeight.w600,
      );
    }

    OutlineInputBorder border(Color color) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 2),
        borderRadius: BorderRadius.circular(appDimensions.radiusM),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar.appbar(context, "Enter Your Bank Details"),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ACCOUNT HOLDER NAME
                buildHeadingText("Account Holder Name"),
                SizedBox(height: appDimensions.verticalSpaceS),
                CustomTextField(
                  controller: profileController["name"]!,
                  hintText: 'Ravi Gupta',
                  validator: nameValidator,
                ),
                SizedBox(height: appDimensions.verticalSpaceM),

                // ACCOUNT NUMBER
                buildHeadingText("Account Number"),
                SizedBox(height: appDimensions.verticalSpaceS),
                CustomTextField(
                  controller: bankController["accountNumber"]!,
                  hintText: 'XXXX XXXX XXXX 5748',
                  // validator: accountNumberValidator,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: appDimensions.verticalSpaceM),

                // CONFIRM ACCOUNT NUMBER
                buildHeadingText("Confirm Account Number"),
                SizedBox(height: appDimensions.verticalSpaceS),
                CustomTextField(
                  controller: bankController["confirmAccountNumber"]!,
                  hintText: 'XXXX XXXX XXXX 5748',
                  // validator: confirmAccountNumberValidator,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: appDimensions.verticalSpaceM),

                // IFSC CODE
                buildHeadingText("IFSC Code"),
                SizedBox(height: appDimensions.verticalSpaceS),
                CustomTextField(
                  controller: bankController["ifscCode"]!,
                  hintText: 'HDFC000001234',
                  // validator: ifscValidator,
                ),
                SizedBox(height: appDimensions.verticalSpaceM),

                // ACCOUNT TYPE
                buildHeadingText("Account Type"),
                SizedBox(height: appDimensions.verticalSpaceS),
                DropdownButtonFormField<String>(
                  value: _currentValue,
                  hint: Inter(
                    text: "Select Account Type",
                    color: AppColors.grey,
                    fontSize: appDimensions.fontS,
                  ),
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: appDimensions.fontS,
                  ),
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
                SizedBox(height: appDimensions.verticalSpaceXL),

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
