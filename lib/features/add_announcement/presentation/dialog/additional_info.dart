import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/common/presentation/widgets/list_tile_with_checkbox.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart' show StringTranslateExtension, tr;

class AdditionalInfoBottomSheet extends StatefulWidget {
  const AdditionalInfoBottomSheet({
    super.key,
  });

  @override
  State<AdditionalInfoBottomSheet> createState() => _AdditionalInfoBottomSheetState();
}

class _AdditionalInfoBottomSheetState extends State<AdditionalInfoBottomSheet> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: LocaleKeys.title_apartmentBuildingType.tr(),
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
        padding: EdgeInsets.only(top: 24,bottom: 40),
        physics: NeverScrollableScrollPhysics(),
        children: [
          CustomTextField(
            controller: TextEditingController(),
            prefix: AppIcons.calendarSmall.toSVGWidget(color: AppColors.labelColor),
            onChanged: (value) {},
            contentPadding: EdgeInsets.zero,
            hintText: LocaleKeys.hints_dateOfBuild.tr(),
          ),
          Gap(12),
          ListTileWithCheckBox(
            title: "Uglovoy",
            isChecked: false,
            checkboxChanged: (value) {},
          ),
          Divider(),
          ListTileWithCheckBox(
            title: "Shift balandligi",
            isChecked: false,
            checkboxChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
