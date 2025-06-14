import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class Explore extends StatelessWidget {
  const Explore({super.key, required this.explore, required this.images});

  final List<String> explore;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 0.35,
      child: ListView.builder(
        itemCount: explore.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 20),
        itemBuilder: (context, index) => Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(images[index]),
            ),
            SizedBox(height: 10),
            Inter(
              text: explore[index],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ],
        ).withPadAllCustom(0, 0, 20, 0),
      ),
    );
  }
}
