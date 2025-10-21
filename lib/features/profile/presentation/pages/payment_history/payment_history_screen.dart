import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/drag_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/title_modal_widget.dart';
import 'package:evo_med/features/profile/presentation/widgets/payment_statistic_item.dart';
import 'package:evo_med/features/profile/presentation/widgets/payment_type_item.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
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
          LocaleKeys.title_paymentHistory.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PaymentStatisticItem(
              title: LocaleKeys.title_allIncome.tr(),
              amount: '120 000',
              icon: AppIcons.arrowDownRight,
              iconBGColor: AppColors.successGreen,
              bgColor: AppColors.bgSuccess,
            ),
            Gap(8),
            PaymentStatisticItem(
              title: LocaleKeys.title_allExpense.tr(),
              amount: '20 000',
              icon: AppIcons.arrowUpRight,
              iconBGColor: AppColors.primaryColor,
              bgColor: AppColors.buttonPrimaryLight,
            ),
            Gap(8),
            PaymentStatisticItem(
              title: LocaleKeys.title_reserved.tr(),
              amount: '20 000',
              icon: AppIcons.history,
              iconBGColor: AppColors.badgeColor,
              bgColor: AppColors.reservedBG,
            ),
            Gap(24),
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              padding: EdgeInsets.zero,
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: LocaleKeys.tab_all.tr(),
                ),
                Tab(
                  text: LocaleKeys.tab_income.tr(),
                ),
                Tab(
                  text: LocaleKeys.tab_expenses.tr(),
                ),
                Tab(
                  text: LocaleKeys.tab_reserved.tr(),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    children: [
                      Text(
                        "25 august, 2023",
                        style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
                      ),
                      Gap(16),
                      PaymentTypeItem(
                        type: PaymentHistoryType.expense,
                        onCheckTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            isScrollControlled: true,
                            useSafeArea: true,
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: context.padding.bottom + context.viewInsets.bottom + 8,
                                  left: 16,
                                  right: 16,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    DragWidget(),
                                    TitleModalWidget(
                                      title: LocaleKeys.title_fiscalCheckInfo.tr(),
                                      onCloseTap: () {
                                        context.pop();
                                      },
                                    ),
                                    SizedBox(
                                      height: context.sizeOf.height * .6,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  LocaleKeys.title_contractNumber.tr(),
                                                  style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
                                                ),
                                                Text(
                                                  "SHN 543587645",
                                                  style: context.textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  LocaleKeys.title_companyName.tr(),
                                                  style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
                                                ),
                                                Text(
                                                  "Mediapark Qoratosh MCHJ",
                                                  style: context.textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  LocaleKeys.title_status.tr(),
                                                  style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
                                                ),
                                                Text(
                                                  "Keshbekka qo'shildi",
                                                  style: context.textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  LocaleKeys.title_dateOfSent.tr(),
                                                  style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
                                                ),
                                                Text(
                                                  "12.02.2025 12:12:24",
                                                  style: context.textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  LocaleKeys.title_contractId.tr(),
                                                  style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
                                                ),
                                                Text(
                                                  "4589 8667 4559 4334",
                                                  style: context.textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(16),
                                    CustomButton(
                                      text: LocaleKeys.btn_close.tr(),
                                      onTap: () {
                                        context.pop();
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        title: "123456",
                        amount: "-20 000",
                        time: "12:00",
                        cardNumber: "**** 3456",
                      ),
                      Gap(16),
                      PaymentTypeItem(
                        type: PaymentHistoryType.income,
                        onCheckTap: () {},
                        title: "Kapital bank",
                        time: "12:00",
                        cardNumber: "**** 3456",
                        amount: "+20 000",
                      ),
                      Gap(16),
                      PaymentTypeItem(
                        type: PaymentHistoryType.reserve,
                        onCheckTap: () {},
                        title: "Kapital bank",
                        time: "12:00",
                        cardNumber: "**** 3456",
                        amount: "-20 000",
                        announceNumber: "E'lon N123456",
                      ),
                    ],
                  ),
                  ListView(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    children: [],
                  ),
                  ListView(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    children: [],
                  ),
                  ListView(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    children: [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
