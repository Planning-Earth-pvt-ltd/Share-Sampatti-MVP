import 'package:share_sampatti_mvp/app/app.dart';

final profileProvider =
    Provider.autoDispose<Map<String, TextEditingController>>((ref) {
      final controller = {
        "name": TextEditingController(text: "Shubham Patel"),
        "mobileNumber": TextEditingController(text: "7764074475"),
        "emailAddress": TextEditingController(),
      };
      ref.onDispose(() {
        for (final c in controller.values) {
          c.dispose();
        }
      });
      return controller;
    });

final documentProvider =
    Provider.autoDispose<Map<String, TextEditingController>>((ref) {
      final controller = {
        "pan": TextEditingController(),
        "addhar": TextEditingController(),
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
