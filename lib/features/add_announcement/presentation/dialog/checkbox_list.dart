import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/common/presentation/widgets/list_tile_with_checkbox.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart' show StringTranslateExtension, tr;

class CheckBoxList extends StatefulWidget {
  const CheckBoxList({
    super.key,
    required this.list,
    required this.title,
  });

  final List<String> list;
  final String title;

  @override
  State<CheckBoxList> createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: widget.title,
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
        children: [
          Gap(24),
          CustomTextField(
            suffix: AppIcons.search.toSVGWidget(),
            hintText: LocaleKeys.hints_search.tr(),
            controller: TextEditingController(),
            onChanged: (value) {},
          ),
          Gap(16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return ListTileWithCheckBox(
                title: widget.list[index],
                isChecked: false,
                checkboxChanged: (value) {},
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 4);
            },
            itemCount: widget.list.length,
          ),
        ],
      ),
    );
  }
}
