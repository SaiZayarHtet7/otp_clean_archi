import "package:flutter/material.dart";
import 'package:otp_clean_archi/core/core.dart';
import 'package:otp_clean_archi/presentation/custom/texts/my_text.dart';

class MyButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double? width;
  const MyButton(
      {super.key, required this.onPressed, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width ?? 100,
      onPressed: () => onPressed(),
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: ColorUtils.primaryColor,
      child: MyText(text, color: Colors.white),
    );
  }
}
