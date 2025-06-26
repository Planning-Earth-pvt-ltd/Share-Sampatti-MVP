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
  double get radiusL => width * 0.04;
  double get radiusXL => aspectRatio;

  // PINPUT RADIUS
  double get defaultPinputRadius => width * 0.14;

  // BUTTON HEIGHT
  double get defaultButtonHeight => height * 0.07;

  // ICONS
  double get iconsM => 20;

  // FONTS
  double get fontXXS => aspectRatio * 17;
  double get fontXS => aspectRatio * 30;
  double get fontS => aspectRatio * 35;
  double get fontM => aspectRatio * 40;
  double get fontL => aspectRatio * 45;
  double get fontXL => aspectRatio * 55;
  double get fontXXL => aspectRatio * 70;

  // HORIZONTAL PADDING
  double get horizontalPaddingXS => width * 0.01;
  double get horizontalPaddingS => width * 0.02;
  double get horizontalPaddingM => width * 0.05;
  double get horizontalPaddingL => width * 0.1;
  double get horizontalPaddingXL => width * 0.2;

  // VERTICAL PADDING
  double get verticalPaddingXS => height * 0.01;
  double get verticalPaddingS => height * 0.02;
  double get verticalPaddingM => height * 0.05;
  double get verticalPaddingL => height * 0.1;
  double get verticalPaddingXL => height * 0.2;

  // HORIZONTAL SPACES
  double get verticalSpaceXS => width * 0.01;
  double get verticalSpaceS => width * 0.02;
  double get verticalSpaceM => width * 0.05;
  double get verticalSpaceL => width * 0.1;
  double get verticalSpaceXL => width * 0.2;

  // VERTICAL SPACES
  double get horizontalSpaceXS => height * 0.01;
  double get horizontalSpaceS => height * 0.02;
  double get horizontalSpaceM => height * 0.05;
  double get horizontalSpaceL => height * 0.1;
  double get horizontalSpaceXL => height * 0.2;
}
