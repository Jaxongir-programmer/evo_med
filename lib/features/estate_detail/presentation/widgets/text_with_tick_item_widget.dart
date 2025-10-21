import 'package:flutter/material.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

import '../../../../core/config/app_icons.dart';

class TextWithTickItemWidget extends StatelessWidget {
  const TextWithTickItemWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
        ),
        AppIcons.tick.toSVGWidget()
      ],
    );
  }
}
