import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:share_sampatti_mvp/common/common.dart';
import 'package:share_sampatti_mvp/core/core.dart';
import 'package:share_sampatti_mvp/scr/features/auth/screens/otp_screen/resend_now.dart';
import 'package:share_sampatti_mvp/scr/src.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  final int length = 6;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(provider);
    final otpValidator = ref.watch(otpValidatorProvider);
    final GlobalKey<FormState> key = GlobalKey<FormState>();

    pinTheme(Color color) {
      return PinTheme(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 2, color: color),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(
          fontFamily: 'Inter',
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 20,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: key,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 70, left: 20, right: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.otpBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Inter(
                text: "Let's Secure \n Your Account",
                color: Theme.of(context).colorScheme.primary,
                fontSize: 36,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              Wrap(
                children: [
                  Inter(
                    text:
                        "OTP sent to +91 XXXXXX${controller["mobileNumber"]?.text.substring(6, 10)} ",
                  ),
                  GestureDetector(
                    onTap: () => context.go("/login"),
                    child: Inter(
                      text: "Edit",
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
              Pinput(
                length: length,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                validator: otpValidator,
                onCompleted: (_) {
                  if (key.currentState!.validate()) {
                    context.go("/navigation");
                  }
                },
                defaultPinTheme: pinTheme(
                  Theme.of(context).colorScheme.secondary,
                ),
                focusedPinTheme: pinTheme(
                  Theme.of(context).colorScheme.primary,
                ),
                errorPinTheme: pinTheme(AppColors.red),
              ),
              SizedBox(height: 20),
              OtpTimer(),
              Spacer(),
              ResendNow(),
            ],
          ).withPadCustom(const EdgeInsets.all(20)),
        ),
      ),
    );
  }
}
