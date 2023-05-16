import 'package:flutter/material.dart';
import 'package:otp_clean_archi/core/core.dart';
import 'package:otp_clean_archi/core/utils/font_utils.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  const MyText(this.text, {super.key, this.style, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          FontUtils.bodyText.copyWith(color: color ?? ColorUtils.textColor),
    );
  }
}
