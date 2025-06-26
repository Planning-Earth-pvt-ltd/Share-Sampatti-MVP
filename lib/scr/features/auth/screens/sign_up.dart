import 'package:share_sampatti_mvp/app/app.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final Map<String, TextEditingController> controller = ref.watch(
      profileProvider,
    );
    final nameValidator = ref.watch(nameValidatorProvider);
    final mobileValidator = ref.watch(mobileValidatorProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: appDimensions.verticalSpaceM,
                horizontal: appDimensions.horizontalSpaceM,
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
                    SizedBox(height: appDimensions.verticalSpaceS),

                    // WELCOME
                    Inter(
                      text: "Create Account",
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: appDimensions.fontXL,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: appDimensions.verticalSpaceM),

                    // HEADER
                    Center(
                      child: Inter(
                        text: "Join the Digital Community",
                        textAlign: TextAlign.center,
                        fontSize: appDimensions.fontL,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: appDimensions.verticalSpaceXS),

                    Center(
                      child: Inter(
                        textAlign: TextAlign.center,
                        text:
                            "Join the world of digital collectibles. Start by verifying your phone number.",
                        fontSize: appDimensions.fontXS,
                      ),
                    ),
                    SizedBox(height: appDimensions.verticalSpaceM),

                    // NAME TEXT FIELD
                    CustomTextField(
                      controller: controller["name"]!,
                      labelText: "Name",
                      hintText: 'Enter your full name',
                      validator: nameValidator,
                    ),
                    SizedBox(height: appDimensions.verticalSpaceS),

                    // MOBILE TEXT FIELD
                    CustomTextField(
                      controller: controller["mobileNumber"]!,
                      labelText: "Phone Number",
                      hintText: "Enter your phone number",
                      keyboardType: TextInputType.number,
                      validator: mobileValidator,
                    ),
                    SizedBox(height: appDimensions.verticalSpaceM),

                    CustomElevatedButton(
                      height: 56,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final authController = ref.read(
                            authProvider.notifier,
                          );
                          final controllers = ref.read(profileProvider);
                          final name = controllers['name']!.text.trim();
                          final phone =
                              "+91${controllers['mobileNumber']!.text.trim()}";
                          authController.setAuthMode(AuthMode.signup);
                          await authController.sendOtp(
                            phone: phone,
                            name: name,
                          );
                          if (ref.read(authProvider).error == null) {
                            context.go("/otpScreen");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(ref.read(authProvider).error!),
                              ),
                            );
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
                            text: "Already have an account? ",
                            fontSize: appDimensions.fontXS,
                          ),
                          CustomTextButton(
                            text: "Sign In",
                            fontSize: appDimensions.fontXS,
                            onTap: () => context.pushReplacement("/login"),
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
