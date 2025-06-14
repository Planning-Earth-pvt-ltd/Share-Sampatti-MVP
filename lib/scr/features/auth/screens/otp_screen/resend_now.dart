import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class ResendNow extends ConsumerWidget {
  const ResendNow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpTimer = ref.watch(otpTimerProvider);

    return (otpTimer == 0)
        ? Wrap(
            children: [
              Inter(text: "Haven't received a code? "),
              CustomTextButton(
                text: "Resend Now!",
                onTap: () {
                  ref.read(otpTimerProvider.notifier).start();
                },
              ),
            ],
          )
        : SizedBox();
  }
}
