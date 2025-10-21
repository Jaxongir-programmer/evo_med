import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/features/common/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/common/presentation/widgets/list_tile_with_checkbox.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart' show StringTranslateExtension, tr;

class InfrostructureBottomSheet extends StatefulWidget {
  const InfrostructureBottomSheet({
    super.key,
  });

  @override
  State<InfrostructureBottomSheet> createState() => _InfrostructureBottomSheetState();
}

class _InfrostructureBottomSheetState extends State<InfrostructureBottomSheet> {
  int activeIndex = 0;

  final List<String> dummyList = [
    "Elektr ta'minoti",
    "Suv ta'minoti",
    "Gaz ta'minoti",
    "Internet ta'minoti",
    "Kanalizatsiya",
    "Shaxsiy relefon",
  ];

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: LocaleKeys.title_infrostructure.tr(),
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
      content: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.only(
          top: 24,
          bottom: 40,
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTileWithCheckBox(
                title: dummyList[index],
                isChecked: activeIndex == index,
                checkboxChanged: (value) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              if (index == dummyList.length - 1)
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
        itemCount: dummyList.length,
      ),
    );
  }
}
