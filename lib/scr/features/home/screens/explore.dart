import 'package:share_sampatti_mvp/app/app.dart';

class Explore extends StatelessWidget {
  const Explore({super.key, required this.explore, required this.images});

  final List<String> explore;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    // return SizedBox(
    //   height: size.width * 0.35,
    //   child: ListView.builder(
    //     itemCount: explore.length,
    //     scrollDirection: Axis.horizontal,
    //     padding: const EdgeInsets.only(right: 20),
    //     itemBuilder: (context, index) =>
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        explore.length,
        (index) => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(100),
                    spreadRadius: 1,
                    blurRadius: 14.8,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 79.87 * 0.5,
                backgroundImage: AssetImage(images[index]),
              ),
            ),
            SizedBox(height: 10),
            Inter(
              text: explore[index],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
    //   ),
    // );
  }
}
