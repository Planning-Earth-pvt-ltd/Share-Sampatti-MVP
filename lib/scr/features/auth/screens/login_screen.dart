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
    final Map<String, TextEditingController> controller = ref.watch(
      profileProvider,
    );
    final mobileValidator = ref.watch(mobileValidatorProvider);
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
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
                        fontSize: 18,
                        onTap: () => context.go("/navigation"),
                      ),
                    ),
                    SizedBox(height: 20),

                    // WELCOME
                    Inter(
                      text: "LogIn",
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: size.height * 0.01),
                    // SIGN UP
                    // Inter(text: "to SignIn !", fontSize: 32.44
                    SizedBox(height: 60),

                    // Sub-header
                    Center(
                      child: Inter(
                        text: "Enter Your Mobile Number",
                        fontSize: 28,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Inter(
                        textAlign: TextAlign.center,
                        text:
                            "Enter your phone number to receive a one-time\npassword (OTP) for secure access to your account.",
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 52),
                    // MOBILE TEXT FIELD
                    CustomTextField(
                      controller: controller["mobileNumber"]!,
                      labelText: "Phone Number",
                      hintText: "Enter Phone Number",
                      keyboardType: TextInputType.number,
                      validator: mobileValidator,
                    ),

                    SizedBox(height: 40),
                    CustomElevatedButton(
                      height: 56,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final authController = ref.read(
                            authProvider.notifier,
                          );
                          final controllers = ref.read(profileProvider);
                          final phone =
                              "+91${controllers['mobileNumber']!.text.trim()}";
                          authController.setAuthMode(AuthMode.login);
                          print("Before sendOtp call on LogInScreen");
                          final success = await authController.sendOtp(
                            phone: phone,
                          );
                          print("After sendOtp call on LogInScreen");
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
                      fontSize: 16,
                      textColor: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.w700,
                    ).withPadHorizontal(3),
                    SizedBox(height: 50),

                    Center(
                      child: Wrap(
                        children: [
                          Inter(text: "Don’t have an account? ", fontSize: 16),
                          CustomTextButton(
                            text: "Sign Up",
                            fontSize: 16,
                            onTap: () => context.pushReplacement("/signUp"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).withPadAllCustom(50, 0, 20, 20),
              ),
            );
          },
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // GET STARTED BUTTON
          ],
        ).withPadCustom(const EdgeInsets.all(20)),
      ),
    );
  }
}
