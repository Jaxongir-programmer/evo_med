import 'package:easy_localization/easy_localization.dart' show StringTranslateExtension;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_checkbox.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_radio_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class SentToModeration extends StatefulWidget {
  const SentToModeration({
    super.key,
  });

  @override
  State<SentToModeration> createState() => _SentToModerationState();
}

class _SentToModerationState extends State<SentToModeration> {
  int _activeIndex = 0;
  bool isTop = false;

  final List<String> _items = [
    LocaleKeys.label_sumPerDay.tr(args: ["3", "50 000"]),
    LocaleKeys.label_sumPerDay.tr(args: ["5", "70 000"]),
    LocaleKeys.label_sumPerDay.tr(args: ["10", "100 000"]),
  ];

  final List<String> _items2 = [
    LocaleKeys.label_sumPerDay.tr(args: ["3", "25 000"]),
    LocaleKeys.label_sumPerDay.tr(args: ["5", "35 000"]),
    LocaleKeys.label_sumPerDay.tr(args: ["10", "50 000"]),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: LocaleKeys.title_attention.tr(),
      onLeadingTap: () {
        context.pop();
      },
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LocaleKeys.label_willChargeForModeration.tr().toStyle(
                style: context.textTheme.labelLarge!.copyWith(fontSize: 18),
                defStyle: context.textTheme.titleSmall!.copyWith(fontSize: 18),
                args: [
                  LocaleKeys.label_reservedTo.tr(args: ["50 000"]),
                ],
                maxLines: 6),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return CustomRadioButton(
                  text: _items[index],
                  value: _activeIndex == index,
                  onChanged: (value) {
                    setState(() {
                      _activeIndex = index;
                    });
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider(height: 12);
              },
              itemCount: _items.length,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.title_upToTop.tr(),
                      style: context.textTheme.headlineSmall!.copyWith(fontSize: 18),
                    ),
                    Text(
                      LocaleKeys.label_upToTopDesc.tr(),
                      style: context.textTheme.bodyMedium,
                    )
                  ],
                ),
                CustomCheckBoxClickable(
                  value: false,
                  onChange: (bool value) {
                    setState(() {
                      isTop = value;
                    });
                  },
                )
              ],
            ),
            if (isTop) ...[
              Gap(8),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return CustomRadioButton(
                    text: _items2[index],
                    value: _activeIndex == index,
                    onChanged: (value) {
                      setState(() {
                        _activeIndex = index;
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 12);
                },
                itemCount: _items2.length,
              ),
            ],
            if (false) ...[
              Gap(16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppIcons.circleWarning.toSVGWidget(color: AppColors.error),
                  Gap(4),
                  Text(
                    LocaleKeys.label_notEnoughBalance.tr(),
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                  CustomButton.transparent(
                    text: LocaleKeys.btn_fillYourBalance.tr(),
                    textStyle: context.textTheme.displaySmall!.copyWith(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.error,
                    ),
                    textColor: AppColors.error,
                    onTap: () {
                      context.pop();
                    },
                  )
                ],
              ),
            ],
            Gap(96),
          ],
        ),
      ),
      controlWidget: Row(
        spacing: 8,
        children: [
          CustomButton.outline(
            onTap: () {
              context.pop();
            },
            text: LocaleKeys.btn_back.tr(),
          ),
          CustomButton(
            isExpanded: true,
            text: LocaleKeys.btn_pay.tr(args: ["(50 000)"]),
            onTap: () {
              context.pushNamed(AppRouter.successScreen, extra: SuccessType.moderation);
            },
          )
        ],
      ),
    );
  }
}
