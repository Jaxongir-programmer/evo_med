import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_radio_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/common/presentation/widgets/list_tile_with_checkbox.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart' show StringTranslateExtension, tr;

class RepairAndEquipmentBottomSheet extends StatefulWidget {
  const RepairAndEquipmentBottomSheet({
    super.key,
  });

  @override
  State<RepairAndEquipmentBottomSheet> createState() => _RepairAndEquipmentBottomSheetState();
}

class _RepairAndEquipmentBottomSheetState extends State<RepairAndEquipmentBottomSheet> {
  int activeIndex = 0;

  final List<String> dummyList = [
    "Zamonaviy ta'mir",
    "Toza ta'mir",
    "Ta'mirtalab",
    "Ta'mirlanmagan",
    "Karobka holatda",
  ];

  final List<String> dummyList2 = [
    "Mebellangan",
    "Boshqa",
  ];

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: LocaleKeys.title_repairAndEquipment.tr(),
      leadingIcon: AppIcons.chevronLeft,
      onLeadingTap: () {
        context.pop();
      },
      controlWidget:  CustomButton(
        text: LocaleKeys.btn_confirm.tr(),
        onTap: () {
          context.pop(activeIndex);
        },
      ),
      content: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 24, bottom: 40),
        children: [
          Text(
            LocaleKeys.title_repair.tr(),
            style: context.textTheme.displaySmall,
          ),
          Gap(16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return CustomRadioButton(
                text: dummyList[index],
                value: activeIndex == index,
                onChanged: (value) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 12);
            },
            itemCount: dummyList.length,
          ),
          Gap(24),
          Text(
            LocaleKeys.title_equipment.tr(),
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
      ),
    );
  }
}
