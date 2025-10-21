import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_radio_button.dart';
import 'package:evo_med/features/common/presentation/widgets/drag_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/title_modal_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class SortingResultModal extends StatefulWidget {
  const SortingResultModal({
    super.key,
  });

  @override
  State<SortingResultModal> createState() => _SortingResultModalState();
}

class _SortingResultModalState extends State<SortingResultModal> {
  final List<String> sortKeys = [
    "Eng yangi e'lonlar",
    "O'rtacha narxdagi e'lonlar",
    "Eng qimmat e'lonlar",
    "Eng arzon e'lonlar",
    "Narx bo'yicha ko'tarilish"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.padding.bottom + context.viewInsets.bottom + 8, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          DragWidget(),
          TitleModalWidget(
            title: LocaleKeys.title_filter.tr(),
            onCloseTap: () {
              context.pop();
            },
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: sortKeys.length,
            itemBuilder: (context, index) {
              return CustomRadioButton(
                text: sortKeys[index],
                value: false,
                onChanged: (value) {},
              );
            },
            separatorBuilder: (context, index) => Divider(height: 4),
          ),
          Gap(32),
          CustomButton(
            text: LocaleKeys.btn_confirm.tr(args: [""]),
            onTap: () {
              context.pop();
            },
          )
        ],
      ),
    );
  }
}
