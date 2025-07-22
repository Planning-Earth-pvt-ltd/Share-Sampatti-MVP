import 'dart:developer';

import 'package:share_sampatti_mvp/app/app.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel>(
  (ref) => UserNotifier(),
);

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier()
    : super(
        UserModel(id: "temporaryId", fullName: "User", phone: "9876543210"),
      ) {
    loadUser();
  }

  Future<void> loadUser() async {
    final user = AuthPreference.getUserData();

    if (user != null) {
      log("User -> $user");
      state = UserModel.fromJson(user);
    }
  }
}
