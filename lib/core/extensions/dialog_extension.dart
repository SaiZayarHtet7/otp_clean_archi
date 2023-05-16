import 'package:flutter/material.dart';
import 'package:otp_clean_archi/core/core.dart';

extension DialogExtension on BuildContext {
  void showMyDialog({
    required Widget child,
  }) {
    Dialog dialog = Dialog(
        backgroundColor: Colors.white,
        insetAnimationCurve: Curves.easeIn,
        insetAnimationDuration: Constants.animationDuration,
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(padding: const EdgeInsets.all(20), child: child));

    showDialog(context: this, builder: (ctx) => dialog);
  }
}
