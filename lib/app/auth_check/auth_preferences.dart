import 'package:share_sampatti_mvp/app/app.dart';

class AuthPreference {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>('authBox');
  }

  static bool isFirstInstall() {
    var box = Hive.box('authBox');
    return box.get('isFirstInstall', defaultValue: true);
  }

  static void setFirstInstall() {
    Hive.box('authBox').put('isFirstInstall', false);
  }

  static bool isUserLoggedIn() {
    var box = Hive.box('authBox');
    return box.get('isLoggedIn', defaultValue: false);
  }

  static void setUserLoggedIn(bool status) {
    Hive.box('authBox').put('isLoggedIn', status);
  }
}
