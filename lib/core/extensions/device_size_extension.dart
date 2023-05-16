import 'package:flutter/material.dart';

extension DeviceSizeExtension on BuildContext {
  double deviceHeight(double i) => MediaQuery.of(this).size.height * (i / 100);
  double deviceWidth(double i) => MediaQuery.of(this).size.width * (i / 100);
}
