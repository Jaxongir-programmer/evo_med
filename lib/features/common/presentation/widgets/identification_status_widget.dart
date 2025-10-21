import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class IdentificationStatusWidget extends StatelessWidget {
  const IdentificationStatusWidget({
    super.key,
    required this.isIdentified,
    this.textStyle,
  });

  final bool isIdentified;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    if (isIdentified) {
      return Row(
        spacing: 4,
        children: [
          AppIcons.identificationCheck.toSVGWidget(),
          Text(
            LocaleKeys.title_identified.tr(),
            style: textStyle??context.textTheme.labelMedium,
          ),
        ],
      );
    } else {
      return Text(
        LocaleKeys.title_notIdentified.tr(),
        style: (textStyle ?? context.textTheme.labelMedium)!.copyWith(
          color: AppColors.labelColor,
        ),
      );
    }
  }
}
