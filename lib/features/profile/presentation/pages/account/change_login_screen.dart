import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class ChangeLoginScreen extends StatefulWidget {
  const ChangeLoginScreen({super.key});

  @override
  State<ChangeLoginScreen> createState() => _ChangeLoginScreenState();
}

class _ChangeLoginScreenState extends State<ChangeLoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          context.pop();
        }),
        title: Text(
          LocaleKeys.title_accountInfo.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomTextField(
          controller: TextEditingController(),
          labelText: LocaleKeys.hints_newLogin.tr(),
          onChanged: (v) {},
        ),
      ),
      bottomNavigationBar: CustomButton(
        margin: EdgeInsets.all(16).copyWith(
          bottom: context.padding.bottom + 8,
        ),
        text: LocaleKeys.btn_saveChanges.tr(),
        onTap: () {},
      ),
    );
  }
}
