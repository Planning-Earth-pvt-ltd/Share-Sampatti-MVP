import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_sampatti_mvp/common/custom_extension/custom_paddingAndMargin.dart';
import 'package:share_sampatti_mvp/common/custom_widgets/custom_texts/inter.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body:Column(
        children: [
          Center(child: Inter(text: "Login").withPadAll(8)
          ),
        ],
      ),
    );
  }
}
