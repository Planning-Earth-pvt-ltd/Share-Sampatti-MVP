import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/common/custom_widgets/custom_texts/inter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Inter(text: "Home")),
    );
  }
}
