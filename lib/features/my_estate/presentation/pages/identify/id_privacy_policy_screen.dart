import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_checkbox.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class IdPrivacyPolicyScreen extends StatelessWidget {
  IdPrivacyPolicyScreen({super.key});

  final ValueNotifier<bool> isPrivacyAccepted = ValueNotifier(false);

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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text('Shaxsiy ma’lumotlar bilan ishlash bo’yicha oferta', style: context.textTheme.displayMedium),
          Text('''
          
          Subject to the fulfillment of these Terms, the Company authorizes the User in a non-transferable, revocable, limited, non-exclusive manner and on a worldwide basis for the duration of the relevant rights; to download, use and modify the Freepik Content, in a device the User owns or controls and only for the purposes and uses allowed in these Terms.
          Subject to the fulfillment of these Terms, the Company authorizes the User in a non-transferable, revocable, limited, non-exclusive manner and on a worldwide basis for the duration of the relevant rights; to download, use and modify the Freepik Content, in a device the User owns or controls and only for the purposes and uses allowed in these Terms.
          '''),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: isPrivacyAccepted,
                  builder: (context, _, child) => CustomCheckBoxClickable(
                    value: false,
                    onChange: (bool value) {
                      isPrivacyAccepted.value = value;
                    },
                  ),
                ),
                Gap(12),
                Text(
                  LocaleKeys.label_agreeWithPrivacyPolicy.tr(),
                  style: context.textTheme.headlineMedium!
                      .copyWith(color: AppColors.primaryColor, decorationColor: AppColors.primaryColor),
                )
              ],
            ),
            Gap(12),
            CustomButton(
              text: LocaleKeys.btn_continue.tr(),
              onTap: () {
                if (isPrivacyAccepted.value) {
                  context.pushNamed(AppRouter.myEstateIdSignPad);
                } else {
                  context.showSnackBar("Shaxsiy offerta qabul qilinmagan");
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
