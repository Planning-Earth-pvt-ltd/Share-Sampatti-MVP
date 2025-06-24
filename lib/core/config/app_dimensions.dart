import 'package:share_sampatti_mvp/app/app.dart';

final appDimensionsProvider = Provider<AppDimensions>((ref) => AppDimensions());

class AppDimensions {
  //Screen Width and Height
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  //Screen Padding
  double paddingSmall(BuildContext context) => screenWidth(context) * 0.02;
  double paddingMedium(BuildContext context) => screenWidth(context) * 0.04;
  double paddingLarge(BuildContext context) => screenWidth(context) * 0.06;

  //Font Size
  double fontSmall(BuildContext context) => screenWidth(context) * 0.04;
  double fontMedium(BuildContext context) => screenWidth(context) * 0.05;
  double fontLarge(BuildContext context) => screenWidth(context) * 0.11;

  //Radius
  double radiusSmall(BuildContext context) => screenWidth(context) * 0.01;
  double radiusMedium(BuildContext context) => screenWidth(context) * 0.02;
  double radiusLarge(BuildContext context) => screenWidth(context) * 0.03;
}
