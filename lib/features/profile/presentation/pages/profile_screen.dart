import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/profile/presentation/widgets/profile_header.dart';
import 'package:evo_med/features/profile/presentation/widgets/profile_menu_item_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
        actions: [
          CustomButton.light(
            margin: EdgeInsets.only(right: 16),
            height: 30,
            text: LocaleKeys.btn_change.tr(),
            onTap: () {
              context.pushNamed(AppRouter.accountInfo);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              children: [
                Text(LocaleKeys.title_profileInfo.tr(), style: context.textTheme.displaySmall),
                Gap(12),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_myAnnouncement.tr(),
                  icon: AppIcons.memo.toSVGWidget(),
                  subtitle: "2 ta",
                  onTap: () {
                    context.pushNamed(AppRouter.myAnnouncementScreen);
                  },
                ),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_myBalance.tr(),
                  icon: AppIcons.moneyBill.toSVGWidget(),
                  subtitle: "44 000 so'm",
                  onTap: () {
                    context.pushNamed(AppRouter.myBalance);
                  },
                ),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_myEstate.tr(),
                  icon: AppIcons.building.toSVGWidget(),
                  subtitle: "2 ta",
                  onTap: () {},
                ),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_contactedAnnouncements.tr(),
                  icon: AppIcons.fileBookmark.toSVGWidget(),
                  onTap: () {},
                ),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_paymentHistory.tr(),
                  icon: AppIcons.history.toSVGWidget(),
                  onTap: () {
                    context.pushNamed(AppRouter.paymentHistory);
                  },
                ),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_selectedAndSearched.tr(),
                  icon: AppIcons.heart.toSVGWidget(),
                  onTap: () {
                    context.pushNamed(AppRouter.savedAnnounce);
                  },
                ),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_mySavedSearches.tr(),
                  icon: AppIcons.saved.toSVGWidget(),
                  onTap: () {},
                ),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_prices.tr(),
                  icon: AppIcons.walletSmall.toSVGWidget(),
                  isDivider: false,
                  onTap: () {
                    context.pushNamed(AppRouter.tariffs);
                  },
                ),
                Gap(32),
                Text(LocaleKeys.title_applicationSettings.tr(), style: context.textTheme.displaySmall),
                Gap(12),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_aboutApp.tr(),
                  icon: AppIcons.infoCircle.toSVGWidget(),
                  onTap: () {
                    context.pushNamed(AppRouter.aboutApp);
                  },
                ),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_notification.tr(),
                  icon: AppIcons.bell.toSVGWidget(),
                  onTap: () {
                    context.pushNamed(AppRouter.notifications);
                  },
                ),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_applicationSettings.tr(),
                  icon: AppIcons.settingsSmall.toSVGWidget(),
                  onTap: () {
                    context.pushNamed(AppRouter.appSetting);
                  },
                ),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_termsAndConditions.tr(),
                  icon: AppIcons.fileInfo.toSVGWidget(),
                  onTap: () {},
                ),
                ProfileMenuItemWidget(
                  title: LocaleKeys.title_logout.tr(),
                  icon: AppIcons.logout.toSVGWidget(),
                  isDivider: false,
                  isShowArrow: false,
                  titleColor: AppColors.error,
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
