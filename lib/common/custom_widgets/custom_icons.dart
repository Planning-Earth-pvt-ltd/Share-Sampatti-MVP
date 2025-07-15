import 'package:share_sampatti_mvp/app/app.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({super.key, required this.icon, this.color});

  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).colorScheme.secondary,
        BlendMode.srcIn,
      ),
    );
  }
}
