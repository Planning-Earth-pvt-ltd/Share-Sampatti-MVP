import 'package:share_sampatti_mvp/app/app.dart';

final showMoreProvider = StateProvider<bool>((ref) => false);

class InvestNow {
  static const List<Map<String, String>> documents = [
    {"title": "Information Memorandum", "date": "16-06-2025"},
    {"title": "Knight Frank", "date": "14-06-2025"},
    {"title": "CA Certificate", "date": "12-06-2025"},
  ];
}
