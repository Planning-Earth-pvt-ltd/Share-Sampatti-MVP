import 'package:share_sampatti_mvp/app/app.dart';

// Now, create your providers like this:
final profileProvider = disposableControllerProvider([
  "name",
  "mobileNumber",
  "emailAddress",
]);

final documentProvider = disposableControllerProvider(["pan", "addhar"]);

final bankProvider = disposableControllerProvider([
  "accountNumber",
  "confirmAccountNumber",
  "ifscCode",
]);

AutoDisposeProvider<Map<String, TextEditingController>>
disposableControllerProvider(List<String> fields) {
  return Provider.autoDispose<Map<String, TextEditingController>>((ref) {
    final controller = {
      for (final field in fields) field: TextEditingController(),
    };
    ref.onDispose(() {
      for (final control in controller.values) {
        control.dispose();
      }
    });
    return controller;
  });
}
