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

class MyBalanceScreen extends StatefulWidget {
  const MyBalanceScreen({super.key});

  @override
  State<MyBalanceScreen> createState() => _MyBalanceScreenState();
}

class _MyBalanceScreenState extends State<MyBalanceScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          context.pop();
        }),
        title: Text(
          LocaleKeys.title_myBalance.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              spacing: 16,
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: AppColors.white,
                  child: AppIcons.wallet.toSVGWidget(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      LocaleKeys.title_currentBalance.tr(),
                      style: context.textTheme.bodyLarge!.copyWith(color: AppColors.labelColor),
                    ),
                    Text(
                      LocaleKeys.label_uzs.tr(args: ["44 000"]),
                      style: context.textTheme.displayMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(12),
          CustomButton.light(
            text: LocaleKeys.btn_buyPackage.tr(),
            onTap: () {},
          ),
          Gap(32),
          Text(
            LocaleKeys.label_reservedAmount.tr(),
            style: context.textTheme.headlineMedium,
          ),
          Gap(16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.bgSuccess,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                AppIcons.infoCircle.toSVGWidget(
                  color: AppColors.successGreen,
                  size: 20,
                ),
                Expanded(
                  child: Text(
                    LocaleKeys.label_reservedInfo.tr(),
                    style: context.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
          Gap(8),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.containerBloc,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 12,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.label_uzs.tr(args: ["44 000"]),
                          style: context.textTheme.headlineMedium,
                        ),
                        Text(
                          "12:23, 12.04.2024",
                          style: context.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    LocaleKeys.label_announceId.tr().toStyle(
                      style: context.textTheme.bodyMedium!.copyWith(color: AppColors.labelColor),
                      defStyle: context.textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
                      args: ['12432523'],
                    ),
                  ],
                ),
              );
            },
            itemCount: 4,
            separatorBuilder: (BuildContext context, int index) => Gap(8),
          )
        ],
      ),
      bottomNavigationBar: CustomButton(
        margin: EdgeInsets.all(16).copyWith(
          bottom: context.padding.bottom + 8,
        ),
        prefix: AppIcons.walletAdd.toSVGWidget(),
        text: LocaleKeys.btn_fillYourBalance.tr(),
        onTap: () {
          context.pushNamed(AppRouter.fillBalance);
        },
      ),
    );
  }
}
