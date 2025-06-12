import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_sampatti_mvp/common/custom_widgets/custom_buttons/custom_base_button.dart';
import 'package:share_sampatti_mvp/common/custom_widgets/custom_texts/inter.dart';
import 'package:share_sampatti_mvp/common/custom_widgets/text_field.dart';
import 'package:share_sampatti_mvp/scr/features/auth/controllers/auth_controller.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, TextEditingController> controller = ref.watch(provider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SKIP
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => context.push("/home"),
                child: Inter(
                  text: "Skip",
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
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
            CustomTextField(controller: controller["name"]!, hintText: "Name"),
            SizedBox(height: 20),

            // MOBILE TEXT FIELD
            CustomTextField(
              controller: controller["mobileNumber"]!,
              hintText: "Mobile Number",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // GET STARTED BUTTON
            CustomElevatedButton(
              onpressed: () => context.push("/home"),
              text: "Send OTP",
              textColor: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 50),

            // ALREADY A USER
            Wrap(
              children: [
                Inter(text: "Already A User? "),
                GestureDetector(
                  onTap: () => context.push("/home"),
                  child: Inter(
                    text: "Sign In",
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
