import 'package:share_sampatti_mvp/app/app.dart';

final provider = Provider.autoDispose<Map<String, TextEditingController>>((
  ref,
) {
  final controller = {
    "name": TextEditingController(),
    "mobileNumber": TextEditingController(),
    "emailAddress": TextEditingController(),
    "pan": TextEditingController(),
  };
  ref.onDispose(() {
    for (final c in controller.values) {
      c.dispose();
    }
  });
  return controller;
});

final bankProvider = Provider.autoDispose<Map<String, TextEditingController>>((
  ref,
) {
  final controller = {
    "name": TextEditingController(),
    "accountNumber": TextEditingController(),
    "confirmAccountNumber": TextEditingController(),
    "ifscCode": TextEditingController(),
  };
  ref.onDispose(() {
    for (final c in controller.values) {
      c.dispose();
    }
  });
  return controller;
});
