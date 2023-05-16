import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../custom/custom.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText(
          StringUtils.message,
          style: FontUtils.bodyText.copyWith(fontWeight: FontWeight.bold),
        ),
        15.height,
        MyText(StringUtils.pleaseWait),
      ],
    );
  }
}
