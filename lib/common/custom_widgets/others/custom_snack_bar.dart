import 'package:share_sampatti_mvp/app/app.dart';

class CustomSnackBar {
  static void snackbar(
    BuildContext context,
    String errorMessage, {
    Color color = AppColors.red,
  }) {
    final snackBar = SnackBar(
      content: Inter(
        text: errorMessage,
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
