import 'dart:async';
import 'dart:developer';
import 'package:share_sampatti_mvp/app/app.dart';

class OtpVerificationScreen extends ConsumerStatefulWidget {
  const OtpVerificationScreen({super.key});
  @override
  ConsumerState<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final int _length = 6;
  Timer? _timer;
  int _timeLeft = 30;

  late final String name;
  late final String phone;

  @override
  void initState() {
    super.initState();
    final controller = ref.read(profileProvider);
    name = controller["name"]?.text.trim() ?? "";
    phone = controller["mobileNumber"]!.text.trim();

    // _startTimer();
  }

  // void _startTimer() {
  //   setState(() => _timeLeft = 30);
  //   _timer?.cancel();
  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     if (_timeLeft > 0) {
  //       setState(() => _timeLeft--);
  //     } else {
  //       _timer?.cancel();
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final authNotifier = ref.read(authProvider.notifier);

    pinTheme(Color color) => PinTheme(
      height: appDimensions.defaultPinputRadius,
      width: appDimensions.defaultPinputRadius,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 2, color: color),
        borderRadius: BorderRadius.circular(appDimensions.radiusS),
      ),
      textStyle: TextStyle(
        fontFamily: AppConstants.interFontFamily,
        color: Theme.of(context).colorScheme.secondary,
        fontSize: appDimensions.fontM,
      ),
    );

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: appDimensions.horizontalPaddingM,
            vertical: appDimensions.verticalPaddingL,
          ),
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
                textAlign: TextAlign.center,
                color: Theme.of(context).colorScheme.primary,
                fontSize: appDimensions.fontXXL,
                fontWeight: FontWeight.w600,
              ),
              Wrap(
                children: [
                  Inter(
                    text: "OTP sent to +91 XXXXXX${phone.substring(6, 10)} ",
                  ),
                  CustomTextButton(
                    text: "Edit",
                    onTap: () => context.go("/login"),
                  ),
                ],
              ),
              SizedBox(height: appDimensions.verticalSpaceXL),

              Pinput(
                length: _length,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                onCompleted: (otp) async {
                  final success = await authNotifier.verifyOtp(
                    name: name.isNotEmpty ? name : null,
                    phone: phone,
                    otp: otp,
                  );
                  if (success) {
                    context.go('/navigation');
                  } else {
                    final errorMsg =
                        ref.read(authProvider).error ??
                        "Invalid OTP, please try again";
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(errorMsg)));

                    // Optionally reset the pinput or show error state
                    ref.read(authProvider.notifier).state = ref
                        .read(authProvider)
                        .copyWith(error: null);
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
              SizedBox(height: appDimensions.verticalSpaceM),

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
                              text: "Resend Now",
                              onTap: () async {
                                ref.read(otpTimerProvider.notifier).start();
                                // Optionally re-trigger OTP here
                                final authController = ref.read(
                                  authProvider.notifier,
                                );
                                await authController.sendOtp(
                                  phone: phone,
                                  name: name,
                                );
                              },
                            ),
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
