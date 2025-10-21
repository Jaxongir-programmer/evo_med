import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/services/presentation/tabs/service_car_tab.dart';
import 'package:evo_med/features/services/presentation/tabs/service_estate_tab.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
          LocaleKeys.title_services.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              controller: tabController,
              tabs: [
                Tab(
                  text: LocaleKeys.tab_estate.tr(args: [""]),
                ),
                Tab(
                  text: LocaleKeys.tab_car.tr(args: [""]),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                EstateServicesTab(),
                CarServicesTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomButton(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ).copyWith(
          bottom: context.padding.bottom + 8,
        ),
        text: LocaleKeys.btn_order.tr(args: ["(2)"]),
        onTap: () {
          context.pushNamed(AppRouter.orderServices);
        },
      ),
    );
  }
}
