import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:share_sampatti_mvp/common/common.dart';
import 'package:share_sampatti_mvp/core/core.dart';
import 'package:share_sampatti_mvp/scr/src.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  final int length = 6;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(codeProvider);

    pinTheme(Color color) {
      return PinTheme(
        height: 56,
        width: 56,
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
      body: Container(
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
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100),
            Pinput(
              length: length,
              onChanged: (value) {
                ref.read(codeProvider.notifier).state = value;
              },
              defaultPinTheme: pinTheme(
                Theme.of(context).colorScheme.secondary,
              ),
              focusedPinTheme: pinTheme(Theme.of(context).colorScheme.primary),
              errorPinTheme: pinTheme(AppColors.red),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Inter(text: "05 Seconds"),
            ),
            Spacer(),
            Wrap(
              children: [
                Inter(text: "Haven't received a code? "),
                GestureDetector(
                  onTap: () => context.pushReplacement("/home"),
                  child: Inter(
                    text: "Resend Now!",
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ).withPadCustom(const EdgeInsets.all(20)),
      ),
    );
  }
}
