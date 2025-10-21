import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/features/common/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_radio_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/estate_announcement/presentation/filter_similar/filter_general_sub_pages.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart' show StringTranslateExtension, tr;

class BuildingMaterialsBottomSheet extends StatefulWidget {
  const BuildingMaterialsBottomSheet({
    super.key,
  });

  @override
  State<BuildingMaterialsBottomSheet> createState() => _BuildingMaterialsBottomSheetState();
}

class _BuildingMaterialsBottomSheetState extends State<BuildingMaterialsBottomSheet> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: LocaleKeys.title_buildingMaterials.tr(),
      leadingIcon: AppIcons.chevronLeft,
      onLeadingTap: () {
        context.pop();
      },
      controlWidget: CustomButton(
        text: LocaleKeys.btn_confirm.tr(),
        onTap: () {
          context.pop(activeIndex);
        },
      ),
      content: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 24, bottom: 40),
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return CustomRadioButton(
                text: buildingMaterials[index],
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
            itemCount: buildingMaterials.length,
          ),
          Gap(12),
          CustomTextField(
            controller: TextEditingController(),
            onChanged: (value) {},
            hintText: LocaleKeys.hints_write.tr(),
          ),
        ],
      ),
    );
  }
}
