import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/profile/presentation/widgets/profile_menu_item_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
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
          LocaleKeys.title_changeLanguage.tr(),
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
              title: "O'zbekcha",
              onTap: () {},
              isShowArrow: false,
              arrow: AppIcons.tick.toSVGWidget(),
            ),
            ProfileMenuItemWidget(
              title: "Ўзбекча",
              onTap: () {},
              isShowArrow: false,
              arrow: AppIcons.tick.toSVGWidget(),
            ),
            ProfileMenuItemWidget(
              title: "Русский",
              onTap: () {},
              isShowArrow: false,
              isDivider: false,
              arrow: AppIcons.tick.toSVGWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
