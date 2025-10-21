import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/my_estate/presentation/pages/tabs/estates_tab_widget.dart';
import 'package:evo_med/features/my_estate/presentation/pages/tabs/user_car_tab_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class MyEstatesScreen extends StatefulWidget {
  const MyEstatesScreen({super.key});

  @override
  State<MyEstatesScreen> createState() => _MyEstatesScreenState();
}

class _MyEstatesScreenState extends State<MyEstatesScreen> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final ValueNotifier<int> currentPage = ValueNotifier(0);


  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)
      ..addListener(
        () {
          currentPage.value = tabController.index;
        },
      );
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
          LocaleKeys.title_myEstate.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
        actions: [
          // CustomButton.transparent(
          //   onTap: () {},
          //   prefix: AppIcons.refresh.toSVGWidget(color: AppColors.primaryColor),
          //   text: LocaleKeys.btn_refresh.tr(),
          //   textStyle: context.textTheme.labelLarge,
          // )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Padding(
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
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          EstatesTabWidget(),
          UserCarTabWidget(),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentPage,
        builder: (context, value, child) => CustomButton.outline(
          onTap: () {
            context.pushNamed(AppRouter.services);
          },
          text: value == 0 ? LocaleKeys.btn_serviceForEstates.tr() : LocaleKeys.btn_serviceForCars.tr(),
          padding: EdgeInsets.symmetric(horizontal: 24),
          margin: EdgeInsets.only(left: 16, right: 16, bottom: context.padding.bottom, top: 8),
        ),
      ),
    );
  }
}
