import 'dart:developer';

import 'package:share_sampatti_mvp/app/app.dart';

class LogInScreen extends ConsumerStatefulWidget {
  const LogInScreen({super.key});

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final Map<String, TextEditingController> profileController = ref.watch(
      profileProvider,
    );
    final mobileValidator = ref.watch(mobileValidatorProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: appDimensions.verticalPaddingL,
                horizontal: appDimensions.horizontalPaddingM,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SKIP
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                        text: "Skip",
                        fontSize: appDimensions.fontS,
                        onTap: () => context.go("/navigation"),
                      ),
                    ),
                    SizedBox(height: appDimensions.verticalSpaceM),

                    // WELCOME
                    Inter(
                      text: "LogIn",
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: appDimensions.fontXXL,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: appDimensions.verticalSpaceXL),

                    // HEADER
                    Center(
                      child: Inter(
                        text: "Enter Your Mobile Number",
                        textAlign: TextAlign.center,
                        fontSize: appDimensions.fontXL,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: appDimensions.verticalSpaceXS),

                    // SUB-HEADER
                    Center(
                      child: Inter(
                        textAlign: TextAlign.center,
                        text:
                            "Enter your phone number to receive a one-time\npassword (OTP) for secure access to your account.",
                        fontSize: appDimensions.fontXS,
                      ),
                    ),
                    SizedBox(height: appDimensions.verticalSpaceL),

                    // MOBILE TEXT FIELD
                    CustomTextField(
                      controller: profileController["mobileNumber"]!,
                      labelText: "Phone Number",
                      hintText: "Enter your phone number",
                      keyboardType: TextInputType.number,
                      validator: mobileValidator,
                    ),
                    SizedBox(height: appDimensions.verticalSpaceM),

                    CustomElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final authController = ref.read(
                            authProvider.notifier,
                          );
                          final controllers = ref.read(profileProvider);
                          final phone =
                              "+91${controllers['mobileNumber']!.text.trim()}";
                          authController.setAuthMode(AuthMode.login);
                          log("Before sendOtp call on LogInScreen");
                          final success = await authController.sendOtp(
                            phone: phone,
                          );
                          log("After sendOtp call on LogInScreen");
                          if (success) {
                            context.go("/otpScreen");
                          } else {
                            final errorMsg =
                                ref.read(authProvider).error ??
                                "Something went wrong";
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(errorMsg)));

                            //Reset Error After Showing
                            ref.read(authProvider.notifier).state = ref
                                .read(authProvider)
                                .copyWith(error: null);
                          }
                        }
                      },
                      text: "Send OTP",
                    ),
                    SizedBox(height: appDimensions.verticalSpaceM),

                    Center(
                      child: Wrap(
                        children: [
                          Inter(
                            text: "Don’t have an account? ",
                            fontSize: appDimensions.fontXS,
                          ),
                          CustomTextButton(
                            text: "Sign Up",
                            fontSize: appDimensions.fontXS,
                            onTap: () => context.pushReplacement("/signUp"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
