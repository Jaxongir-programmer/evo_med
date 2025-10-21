import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/common/presentation/widgets/list_tile_with_checkbox.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class ThirdStepWidget extends StatelessWidget {
  ThirdStepWidget({super.key});

  final List<String> dummyList2 = [
    "Narx kelishiladi",
    "Ayriboshlash mumkin",
    "Nasiya savdo orqali",
    "Ipoteka",
    "Boshqa"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
        bottom: context.padding.bottom + 16,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Text(
                "Ko'chmas mulk narxi",
                style: context.textTheme.displaySmall,
              ),
              Spacer(),
              Text(
                "sh.b",
                style: context.textTheme.headlineSmall,
              ),
              Transform.scale(
                scale: .7,
                child: CupertinoSwitch(
                  value: false,
                  activeTrackColor: AppColors.primaryColor,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
        CustomTextField(
          controller: TextEditingController(),
          onChanged: (value) {},
        ),
        Gap(8),
        Text(
          LocaleKeys.label_expensiveThanUsual.tr(args: ["4"]),
          style: context.textTheme.labelMedium,
        ),
        Gap(32),
        Text(
          "Qo'shimcha shartlar",
          style: context.textTheme.displaySmall,
        ),
        Gap(16),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTileWithCheckBox(
                  title: dummyList2[index],
                  isChecked: false,
                  checkboxChanged: (value) {},
                ),
                if (index == dummyList2.length - 1)
                  CustomTextField(
                    controller: TextEditingController(),
                    onChanged: (value) {},
                    hintText: LocaleKeys.hints_write.tr(),
                  ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(height: 4);
          },
          itemCount: dummyList2.length,
        ),
      ],
    );
  }
}
