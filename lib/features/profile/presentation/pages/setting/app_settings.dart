import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/profile/presentation/widgets/profile_menu_item_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
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
          LocaleKeys.title_applicationSettings.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProfileMenuItemWidget(
              title: LocaleKeys.title_changeLanguage.tr(),
              onTap: () {
                context.pushNamed(AppRouter.changeLanguage);
              },
            ),
            ProfileMenuItemWidget(
              title: LocaleKeys.title_biometricLogin.tr(),
              isShowArrow: false,
              arrow: CupertinoSwitch(
                activeTrackColor: AppColors.primaryColor,
                value: true,
                onChanged: (v) {},
              ),
            ),
            ProfileMenuItemWidget(
              title: LocaleKeys.title_changePinCode.tr(),
              onTap: () {},
            ),
            ProfileMenuItemWidget(
              title: LocaleKeys.title_findLocation.tr(),
              isShowArrow: false,
              isDivider: false,
              arrow: CupertinoSwitch(
                activeTrackColor: AppColors.primaryColor,
                value: true,
                onChanged: (v) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
