import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios),
          color: AppColors.lightGrey,
        ),
      ),
      body: Center(child: Inter(text: "Profile")),
    );
  }
}
