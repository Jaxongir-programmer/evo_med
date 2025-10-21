import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class TitleModalWidget extends StatelessWidget {
  const TitleModalWidget({
    super.key,
    required this.title,
    required this.onCloseTap,
    this.onActionTap,
    this.leadingIcon,
  });

  final String title;
  final Function() onCloseTap;
  final Function()? onActionTap;
  final String? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            top: 0,
            child: (leadingIcon ?? AppIcons.cross).toSVGWidget(onTap: onCloseTap),
          ),
          Center(
            child: Text(
              title,
              style: context.textTheme.displaySmall,
            ),
          ),
          if (onActionTap != null)
            Positioned(
              bottom: 0,
              top: 0,
              right: 0,
              child: CustomButton.transparent(
                onTap: onActionTap!,
                text: LocaleKeys.btn_clear.tr(),
                padding: EdgeInsets.symmetric(horizontal: 8),
              ),
            )
        ],
      ),
    );
  }
}
