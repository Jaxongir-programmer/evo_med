import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          context.pop();
        }),
        title: Text(
          LocaleKeys.title_privacyPolicy.tr(),
          style: context.textTheme.displaySmall,
        ),
        surfaceTintColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('''
          Subject to the fulfillment of these Terms, the Company authorizes the User in a non-transferable, revocable, limited, non-exclusive manner and on a worldwide basis for the duration of the relevant rights; to download, use and modify the Freepik Content, in a device the User owns or controls and only for the purposes and uses allowed in these Terms.
          Subject to the fulfillment of these Terms, the Company authorizes the User in a non-transferable, revocable, limited, non-exclusive manner and on a worldwide basis for the duration of the relevant rights; to download, use and modify the Freepik Content, in a device the User owns or controls and only for the purposes and uses allowed in these Terms.
          '''),
        ),
      ),
      floatingActionButton: CustomButton(
        text: LocaleKeys.btn_agreeWithPrivacyPolicy.tr(),
        onTap: () {
          context.pop("Privacy Policy Accepted");
        },
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
