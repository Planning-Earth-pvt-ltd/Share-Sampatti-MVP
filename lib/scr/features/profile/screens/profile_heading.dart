import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class ProfileHeading extends StatelessWidget {
  const ProfileHeading({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Inter(
      text: text,
      color: AppColors.lightGrey,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ).withPadAll(20);
  }
}
