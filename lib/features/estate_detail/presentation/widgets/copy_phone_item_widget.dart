import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';

import '../../../../core/config/app_icons.dart';

class CopyPhoneItemWidget extends StatelessWidget {
  const CopyPhoneItemWidget({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        // Text(
        //   LocaleKeys.title_phone.tr(),
        //   style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              phoneNumber,
              style: context.textTheme.headlineMedium!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            CustomButton(
              onTap: () {
                Clipboard.setData(ClipboardData(text: phoneNumber));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Copied $phoneNumber"),
                  ),
                );
              },
              width: 32,
              height: 32,
              color: AppColors.buttonPrimaryLight,
              child: AppIcons.copy.toSVGWidget(),
            ),
          ],
        )
      ],
    );
  }
}
