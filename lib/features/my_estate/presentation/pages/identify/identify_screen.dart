import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class IdentifyScreen extends StatelessWidget {
  const IdentifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          context.pop();
        }),
        title: Text(
          LocaleKeys.title_myEstate.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 120,
              backgroundColor: AppColors.placeHolder,
            ),
            Gap(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                LocaleKeys.label_toSeeEstateIdentify.tr(),
                style: context.textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Gap(8),
            Text(
              LocaleKeys.label_identifyByMyID.tr(),
              style: context.textTheme.bodyLarge!.copyWith(
                color: AppColors.labelColor,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      floatingActionButton: CustomButton(
        text: LocaleKeys.btn_identify.tr(),
        onTap: () {
          context.pushNamed(AppRouter.myEstateIdPrivacy);
        },
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
