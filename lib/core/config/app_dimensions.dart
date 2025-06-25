import 'package:share_sampatti_mvp/app/app.dart';

final appDimensionsProvider = Provider<AppDimensions>((ref) {
  throw UnimplementedError("Error in application dimensions");
});

class AppDimensions {
  // HEIGHT, WIDTH AND RATIO
  final double aspectRatio;
  final double width;
  final double height;

  AppDimensions(this.aspectRatio, this.width, this.height);

  // Button Radius
  double get radiusM => aspectRatio;

  double get fontM => aspectRatio;

  //Screen Padding
  // double paddingSmall(BuildContext context) => screenWidth(context) * 0.02;
  // double paddingMedium(BuildContext context) => screenWidth(context) * 0.04;
  // double paddingLarge(BuildContext context) => screenWidth(context) * 0.06;

  //Font Size
  // double fontSmall(BuildContext context) => screenWidth(context) * 0.04;
  // double fontMedium(BuildContext context) => screenWidth(context) * 0.05;
  // double fontLarge(BuildContext context) => screenWidth(context) * 0.11;

  //Radius
  // double radiusSmall(BuildContext context) => screenWidth(context) * 0.01;
  // double radiusMedium(BuildContext context) => screenWidth(context) * 0.02;
  // double radiusLarge(BuildContext context) => screenWidth(context) * 0.03;
}
