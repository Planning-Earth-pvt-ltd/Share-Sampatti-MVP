import 'package:share_sampatti_mvp/app/app.dart';

extension AlignmentExtensions on Widget {
  // LEFT
  Widget leftAlignment() => Align(alignment: Alignment.centerLeft, child: this);

  // RIGHT
  Widget rightAlignment() =>
      Align(alignment: Alignment.centerRight, child: this);

  // CENTER
  Widget centerAlignment() => Align(alignment: Alignment.center, child: this);
}
