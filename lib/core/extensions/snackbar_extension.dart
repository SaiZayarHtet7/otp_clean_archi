import 'package:flutter/material.dart';
import 'package:otp_clean_archi/presentation/custom/custom.dart';

import '../core.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar(String message, String title,
      {SnackbarType type = SnackbarType.normal}) {
    SnackBar snackBar = SnackBar(
      
      clipBehavior: Clip.antiAliasWithSaveLayer,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.vertical,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(this).size.height - 170, left: 20, right: 20),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyText(
            title,
            style: FontUtils.titleText.copyWith(color: Colors.white),
          ),
          10.height,
          MyText(
            message,
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: type == SnackbarType.normal
          ? ColorUtils.primaryColor
          : type == SnackbarType.error
              ? ColorUtils.errorColor
              : ColorUtils.successColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

    ScaffoldMessenger.of(this).showSnackBar(
      snackBar,
    );
  }
}

enum SnackbarType { normal, success, error }
