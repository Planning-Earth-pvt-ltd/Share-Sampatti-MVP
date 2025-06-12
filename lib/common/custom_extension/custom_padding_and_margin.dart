import 'package:flutter/material.dart';

extension PaddingExtensions on Widget {
  //All Padding
  Widget withPadAll(double val) =>
      Padding(padding: EdgeInsetsGeometry.all(val));

  //Horizontal Padding
  Widget withPadHorizontal(double val) => Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: val),
    child: this,
  );

  //Vertical Padding
  Widget withPadVertical(double val) => Padding(
    padding: EdgeInsetsGeometry.symmetric(vertical: val),
    child: this,
  );

  // REVIEW
  //Symmetric Padding
  Widget withPadSymmetric(double vert, double hor) => Padding(
    padding: EdgeInsetsGeometry.symmetric(vertical: vert, horizontal: hor),
    child: this,
  );

  //Custom Padding
  Widget withPadCustom(EdgeInsets padding) =>
      Padding(padding: padding, child: this);

  //Pad All(top,bottom,left,right)
  Widget withPadAllCustom(
    double top,
    double bottom,
    double left,
    double right,
  ) => Padding(
    padding: EdgeInsetsGeometry.fromLTRB(left, top, right, bottom),
    child: this,
  );

  //All Margin
  Widget withMarginAll(double val) =>
      Padding(padding: EdgeInsetsGeometry.all(val), child: this);

  //Horizontal Margin
  Widget withMarginHorizontal(double val) => Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: val),
    child: this,
  );

  //Vertical Margin
  Widget withMarginVertical(double val) => Padding(
    padding: EdgeInsetsGeometry.symmetric(vertical: val),
    child: this,
  );
}
