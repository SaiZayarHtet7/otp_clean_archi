import 'package:flutter/material.dart';

extension SizedBoxExtension on int? {
  SizedBox get height => SizedBox(height: this!.toDouble());
  SizedBox get width => SizedBox(width: this!.toDouble());
  SizedBox get wh => SizedBox(
        width: this!.toDouble(),
        height: this!.toDouble(),
      );
}
