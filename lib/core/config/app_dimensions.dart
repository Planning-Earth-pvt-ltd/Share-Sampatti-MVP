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

  // BUTTON RADIUS
  double get radiusXS => aspectRatio;
  double get radiusS => width * 0.02;
  double get radiusM => width * 0.03;
  double get radiusL => aspectRatio;
  double get radiusXL => aspectRatio;

  // PINPUT RADIUS
  double get defaultPinputRadius => width * 0.14;

  // BUTTON HEIGHT
  double get defaultButtonHeight => height * 0.07;

  // FONTS
  double get fontXS => aspectRatio * 30;
  double get fontS => aspectRatio * 35;
  double get fontM => aspectRatio * 40;
  double get fontL => aspectRatio * 55;
  double get fontXL => aspectRatio * 70;

  // PADDING
  double get paddingXS => aspectRatio;
  double get paddingS => aspectRatio;
  double get paddingM => aspectRatio;
  double get paddingL => aspectRatio;
  double get paddingXL => aspectRatio;

  // VERTICAL SPACES
  double get verticalSpaceXS => height * 0.01;
  double get verticalSpaceS => height * 0.02;
  double get verticalSpaceM => height * 0.05;
  double get verticalSpaceL => height * 0.1;
  double get verticalSpaceXL => height * 0.2;

  // HORIZONTAL SPACES
  double get horizontalSpaceM => width * 0.05;

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
