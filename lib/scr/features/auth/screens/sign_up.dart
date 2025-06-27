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
    final Map<String, TextEditingController> controller = ref.watch(
      profileProvider,
    );
    final nameValidator = ref.watch(nameValidatorProvider);
    final mobileValidator = ref.watch(mobileValidatorProvider);
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: Center(
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
                        text: "Create Account",
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: size.height * 0.01),

                      // SIGN UP
                      Inter(
                        text: "Please SignUp to create an account",
                        fontSize: 18,
                      ),
                      SizedBox(height: size.height * 0.09),
                      Center(
                        child: Inter(text: 'Enter your Details', fontSize: 28),
                      ),
                      SizedBox(height: size.height * 0.03),
                      // NAME TEXT FIELD
                      CustomTextField(
                        controller: controller["name"]!,
                        labelText: "Name",
                        hintText: 'Enter Name',
                        validator: nameValidator,
                      ),
                      SizedBox(height: 20),

                      // MOBILE TEXT FIELD
                      CustomTextField(
                        controller: controller["mobileNumber"]!,
                        labelText: "Phone Number",
                        hintText: "Enter Phone Number",
                        keyboardType: TextInputType.number,
                        validator: mobileValidator,
                      ),
                      SizedBox(height: size.height * 0.03),
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
                        fontSize: 16,
                        textColor: AppColors.darkGrey,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: size.height * 0.02),

                      Center(
                        child: Wrap(
                          children: [
                            Inter(
                              text: "Do you have an account? ",
                              fontSize: 15,
                            ),
                            CustomTextButton(
                              text: "Sign In",
                              fontSize: 15,
                              onTap: () => context.pushReplacement("/login"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).withPadAllCustom(50, 0, 20, 20),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
