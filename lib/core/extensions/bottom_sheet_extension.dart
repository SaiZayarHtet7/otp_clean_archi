import 'package:flutter/material.dart';

extension BottomSheetExtension on BuildContext {
  void showMyBottomSheet({
    required Widget child,
  }) {
    showBottomSheet(
      elevation: 0,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: this,
      builder: (context) {
        return child;
      },
    );
  }
}
