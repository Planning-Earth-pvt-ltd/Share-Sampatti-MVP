import 'dart:developer';
import 'package:share_sampatti_mvp/app/app.dart';

class CompleteYourProfileScreen extends ConsumerStatefulWidget {
  const CompleteYourProfileScreen({super.key});

  @override
  ConsumerState<CompleteYourProfileScreen> createState() =>
      _CompleteYourProfileScreenState();
}

class _CompleteYourProfileScreenState
    extends ConsumerState<CompleteYourProfileScreen> {
  // FORM KEY
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // CONTROLLER
    final Map<String, TextEditingController> profileController = ref.watch(
      profileProvider,
    );
    final Map<String, TextEditingController> documentController = ref.watch(
      documentProvider,
    );

    // VALIDATOR
    final nameValidator = ref.watch(nameValidatorProvider);
    final emailValidator = ref.watch(emailValidatorProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar.appbar(context, "Complete Your Profile"),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Inter(
                  text:
                      "Add your contact info to get resemblance updates, portfolio insights, reminders & more",
                  color: AppColors.lightGrey,
                  fontSize: 12,
                ),
                SizedBox(height: size.height * 0.03),

                // NAME
                CustomText.buildHeadingText("Name"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: profileController["name"]!,
                  hintText: 'Ravi Gupta',
                  validator: nameValidator,
                ),
                SizedBox(height: size.height * 0.03),

                // EMAIL ADDRESS
                CustomText.buildHeadingText("Email Address"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: profileController["emailAddress"]!,
                  hintText: 'ravi.gupta007@gmail.com',
                  validator: emailValidator,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: size.height * 0.03),

                // PHONE NUMBER
                CustomText.buildHeadingText("Phone Number"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: profileController["mobileNumber"]!,
                  hintText: '9876543210',
                  readOnly: true,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: size.height * 0.01),
                Inter(
                  text: "Cannot edit phone number",
                  color: AppColors.lightGrey,
                  fontSize: 12,
                ),
                SizedBox(height: size.height * 0.03),

                // PAN CARD
                CustomText.buildHeadingText("PAN"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: documentController["pan"]!,
                  hintText: 'XXXXXX756C',
                  readOnly: true,
                ),
                SizedBox(height: size.height * 0.01),
                Wrap(
                  children: [
                    Inter(
                      text: "PAN cannot be edited once verified.  ",
                      fontSize: 12,
                      color: AppColors.lightGrey,
                    ),

                    // LEARN MORE
                    CustomTextButton(
                      text: "Learn more",
                      fontSize: 12,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // RESET BUTTON
                    CustomElevatedButton(
                      onPressed: () => ref.invalidate(profileProvider),
                      text: "Reset",
                      width: size.width * 0.43,
                      backgroundColor: AppColors.darkGrey,
                      textColor: Theme.of(context).colorScheme.primary,
                    ),

                    // SAVE BUTTON
                    CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          log("Profile check");
                          context.pop();
                        }
                      },
                      text: "Save",
                      width: size.width * 0.43,
                      textColor: AppColors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
