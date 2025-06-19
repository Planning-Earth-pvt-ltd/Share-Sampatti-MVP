import 'package:url_launcher/url_launcher.dart';

class CustomUrlLauncher {
  static Future<void> telephone() async {
    final Uri uri = Uri.parse('tel:+91 9855869999');

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
