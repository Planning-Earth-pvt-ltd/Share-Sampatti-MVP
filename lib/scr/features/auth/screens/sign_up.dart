// PACKAGE
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// RIVERPOD
import 'package:share_sampatti_mvp/scr/features/auth/controllers/auth_controller.dart';

// COMPONENTS
import 'package:share_sampatti_mvp/common/common.dart';
import 'package:share_sampatti_mvp/core/core.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, TextEditingController> controller = ref.watch(provider);
    final nameValidator = ref.watch(nameValidatorProvider);
    final mobileValidator = ref.watch(mobileValidatorProvider);
    final GlobalKey<FormState> key = GlobalKey<FormState>();

    return Form(
      key: key,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Column(
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
                text: "Welcome",
                color: Theme.of(context).colorScheme.primary,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),

              // SIGN UP
              Inter(text: "Sign Up To Continue !", fontSize: 28),
              SizedBox(height: 50),

              // NAME TEXT FIELD
              CustomTextField(
                controller: controller["name"]!,
                labelText: "John doe",
                validator: nameValidator,
              ),
              SizedBox(height: 20),

              // MOBILE TEXT FIELD
              CustomTextField(
                controller: controller["mobileNumber"]!,
                labelText: "1234567890",
                keyboardType: TextInputType.number,
                validator: mobileValidator,
              ),
            ],
          ).withPadAllCustom(50, 0, 20, 20),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // GET STARTED BUTTON
              CustomElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    context.go("/otpScreen");
                  }
                },
                text: "Send OTP",
                textColor: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 50),

              Wrap(
                children: [
                  Inter(text: "Already A User? "),
                  CustomTextButton(
                    text: "Sign In",
                    onTap: () => context.pushReplacement("/login"),
                  ),
                ],
              ),
            ],
          ).withPadCustom(const EdgeInsets.all(20)),
        ),
      ),
    );
  }
}
