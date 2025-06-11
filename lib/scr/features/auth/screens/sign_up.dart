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
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 50,
          bottom: 30,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height - 80),
          child: IntrinsicHeight(
            child: Column(
              children: [
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Inter(
                        text: "Welcome",
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                      Inter(text: "Sign Up To Continue !", fontSize: 28),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Column(
                  children: [
                    CustomTextField(
                      controller: controller["name"]!,
                      hintText: "Name",
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: controller["mobileNumber"]!,
                      hintText: "Mobile Number",
                    ),
                  ],
                ),
                Spacer(flex: 5),
                Column(
                  children: [
                    // GET STARTED BUTTON
                    CustomElevatedButton(
                      onpressed: () => context.push("/home"),
                      text: "Send OTP",
                      textColor: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 10),
                    // CustomElevatedButton(
                    //   onpressed: () => context.push("/home"),
                    //   text: "Continue as a Guest",
                    //   textColor: Theme.of(context).colorScheme.tertiary,
                    //   fontWeight: FontWeight.w600,
                    // ),
                  ],
                ),
                Spacer(),
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
        ),
      ),
    );
  }
}
