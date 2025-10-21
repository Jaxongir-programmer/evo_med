import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/config/app_images.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/profile/presentation/widgets/payment_item_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class FillBalanceScreen extends StatefulWidget {
  const FillBalanceScreen({super.key});

  @override
  State<FillBalanceScreen> createState() => _FillBalanceScreenState();
}

class _FillBalanceScreenState extends State<FillBalanceScreen> with SingleTickerProviderStateMixin {
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
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Text(
              LocaleKeys.title_fillYourBalance.tr(),
              style: context.textTheme.displayLarge,
            ),
            const Gap(32),
            CustomTextField(
              title: LocaleKeys.title_enterSum.tr(),
              titleStyle: context.textTheme.displaySmall,
              hintText: LocaleKeys.hints_summ.tr(),
              keyboardType: TextInputType.number,
              controller: TextEditingController(),
              onChanged: (value) {},
            ),
            Gap(24),
            Text(
              LocaleKeys.title_paymentMethod.tr(),
              style: context.textTheme.displaySmall,
            ),
            Gap(16),
            Row(
              spacing: 8,
              children: [
                PaymentItem(
                  isSelected: true,
                  image: AppImages.click,
                  onTap: () {},
                ),
                PaymentItem(
                  isSelected: false,
                  image: AppImages.payme,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
        bottomNavigationBar: CustomButton(
          margin: EdgeInsets.all(16).copyWith(
            bottom: context.padding.bottom + 8,
          ),
          text: LocaleKeys.btn_continue.tr(),
          onTap: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
