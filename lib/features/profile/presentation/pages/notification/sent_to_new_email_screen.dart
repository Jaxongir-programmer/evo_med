import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class SentToNewEmailScreen extends StatefulWidget {
  const SentToNewEmailScreen({super.key});

  @override
  State<SentToNewEmailScreen> createState() => _SentToNewEmailScreenState();
}

class _SentToNewEmailScreenState extends State<SentToNewEmailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
            context.pop();
          }),
          toolbarHeight: 64,
          surfaceTintColor: AppColors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                LocaleKeys.title_sendNewAddToEmail.tr(),
                style: context.textTheme.displayLarge,
              ),
              Gap(32),
              CustomTextField(
                controller: TextEditingController(),
                labelText: LocaleKeys.hints_enterEmail.tr(),
                onChanged: (v) {},
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomButton(
          margin: EdgeInsets.all(16).copyWith(
            bottom: context.padding.bottom + 8,
          ),
          text: LocaleKeys.btn_saveChanges.tr(),
          onTap: () {},
        ),
      ),
    );
  }
}
