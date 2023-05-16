import 'package:flutter/material.dart';
import 'package:otp_clean_archi/core/core.dart';

extension RouteExtension on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
    widget.toStringShort().log();
  }

  void back() {
    "back".log();
    Navigator.pop(this);
  }
}
