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

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
          LocaleKeys.title_notification.tr(),
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
              title: LocaleKeys.title_sendNewAddToEmail.tr(),
              onTap: () {
                context.pushNamed(AppRouter.sentToNewEmail);
              },
            ),
            ProfileMenuItemWidget(
              title: LocaleKeys.title_notification.tr(),
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
