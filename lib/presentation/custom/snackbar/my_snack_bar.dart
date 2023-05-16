import 'package:flutter/material.dart';
import 'package:otp_clean_archi/core/core.dart';
import 'package:otp_clean_archi/presentation/custom/custom.dart';

class MySnackBar extends StatelessWidget {
  final String title, body;

  const MySnackBar({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: context.deviceWidth(80),
        margin: EdgeInsets.symmetric(horizontal: context.deviceWidth(10)),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: ColorUtils.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title,
                style: FontUtils.titleText.copyWith(color: Colors.white),
              ),
              10.height,
              MyText(
                body,
                color: Colors.white,
              ),
            ]),
      ),
    );
  }
}
