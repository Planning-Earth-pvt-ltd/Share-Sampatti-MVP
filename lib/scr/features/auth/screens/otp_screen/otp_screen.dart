import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:share_sampatti_mvp/common/common.dart';
import 'package:share_sampatti_mvp/core/core.dart';
import 'package:share_sampatti_mvp/scr/features/auth/screens/otp_screen/resend_now.dart';
import 'package:share_sampatti_mvp/scr/src.dart';

import '../../../providers/auth_provider.dart';

//
class OtpVerificationScreen extends ConsumerStatefulWidget {
  const OtpVerificationScreen({super.key});
  @override
  ConsumerState<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  final int length = 6;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Timer? _timer;
  int _timeLeft = 30;

  late final String name;
  late final String phone;

  @override
  void initState() {
    super.initState();
    final controller = ref.read(provider);
    name = controller["name"]?.text.trim() ?? "";
    phone = "+91${controller["mobileNumber"]!.text.trim()}";

    _startTimer();
  }

  void _startTimer() {
    setState(() => _timeLeft = 30);
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() => _timeLeft--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  pinTheme(Color color) => PinTheme(
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

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
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
                        "OTP sent to ${phone.replaceRange(8, phone.length, '****')} ",
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
                onCompleted: (otp) async {
                  await authNotifier.verifyOtp(
                    name: name.isNotEmpty ? name : null,
                    phone: phone,
                    otp: otp,
                  );
                  if (ref.read(authProvider).error == null) {
                    context.go("/home");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(ref.read(authProvider).error!)),
                    );
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
              Consumer(
                builder: (context, ref, _) {
                  final timer = ref.watch(otpTimerProvider);
                  return timer > 0
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Inter(text: "Resend OTP in $timer sec"),
                        )
                      : Wrap(
                          children: [
                            Inter(text: "Didn't receive OTP? "),
                            CustomTextButton(
                              text: "Resend Now!",
                              onTap: () {
                                ref.read(otpTimerProvider.notifier).start();
                                // Optionally re-trigger OTP here
                              },
                            ),
                          ],
                        );
                },
              ),
            ],
          ).withPadCustom(const EdgeInsets.all(20)),
        ),
      ),
    );
  }
}
