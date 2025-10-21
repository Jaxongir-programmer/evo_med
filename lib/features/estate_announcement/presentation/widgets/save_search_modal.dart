import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/common/presentation/widgets/title_modal_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

import '../../../common/presentation/widgets/custom_button.dart';

class SaveSearchModal extends StatelessWidget {
  const SaveSearchModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.padding.bottom + context.viewInsets.bottom + 8, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleModalWidget(
            title: LocaleKeys.title_saveSearch.tr(),
            onCloseTap: () {
              context.pop();
            },
          ),
          const Gap(24),
          CustomTextField(
            controller: TextEditingController(),
            onChanged: (text) {},
            labelText: LocaleKeys.hints_saveSearchName.tr(),
          ),
          const Gap(24),
          CustomButton(
            onTap: () {},
            text: LocaleKeys.btn_saveSearch.tr(),
          ),
        ],
      ),
    );
  }
}
