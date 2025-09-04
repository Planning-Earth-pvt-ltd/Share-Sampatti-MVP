import 'package:share_sampatti_mvp/app/app.dart';

class CustomAppBar {
  static AppBar appbar(BuildContext context, String title) => AppBar(
    leading: IconButton(
      onPressed: () => context.pop(),
      icon: Icon(Icons.arrow_back_sharp),
      color: AppColors.lightGrey,
    ),
    title: Text(title),
  );
}
