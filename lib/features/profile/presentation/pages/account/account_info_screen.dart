import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/profile/presentation/widgets/profile_menu_item_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
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
        child: Column(
          children: [
            ProfileMenuItemWidget(
              title: LocaleKeys.title_changeLogin.tr(),
              onTap: () {
                context.pushNamed(AppRouter.changeLogin);
              },
            ),
            ProfileMenuItemWidget(
              title: LocaleKeys.title_changePassword.tr(),
              onTap: () {
                context.pushNamed(AppRouter.changePassword);
              },
              isDivider: false,
            ),
          ],
        ),
      ),
    );
  }
}
