import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_sampatti_mvp/common/custom_widgets/text_field.dart';
import 'package:share_sampatti_mvp/core/config/config.dart';
import 'package:share_sampatti_mvp/common/custom_widgets/custom_buttons/custom_base_button.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Share Sampatti',
      theme: dark,
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(controller: _controller, hintText: "Name"),
          SizedBox(height: 10),
          CustomElevatedButton(
            onpressed: () {},
            text: "SEND OTP",
            color: darkGrey,
          ),
        ],
      ),
    );
  }
}
