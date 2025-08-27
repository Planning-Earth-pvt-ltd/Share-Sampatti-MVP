import 'dart:developer';

import 'package:share_sampatti_mvp/app/app.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>(
  (ref) => UserNotifier(),
);

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null) {
    loadUser();
  }

  Future<void> loadUser() async {
    final user = AuthPreference.getUserData();

    if (user != null) {
      log("User not null");
      state = UserModel.fromJson(user);
    } else {
      state = UserModel(id: "id", name: "User", phone: "9876543210");
    }
  }
}
