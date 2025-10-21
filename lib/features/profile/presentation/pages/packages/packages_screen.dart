import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/service_locator.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/profile/presentation/blocs/packages/packages_bloc.dart';
import 'package:evo_med/features/profile/presentation/pages/packages/tabs/add_announcement_tab.dart';
import 'package:evo_med/features/profile/presentation/pages/packages/tabs/see_announcement_tab.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> with SingleTickerProviderStateMixin {
  late final PackagesBloc tariffsBloc;
  late final TabController tabController;
  final ValueNotifier<bool> isAddTariff = ValueNotifier(false);

  @override
  void initState() {
    tariffsBloc = PackagesBloc(
        getTariffsUseCase: serviceLocator(),
        buyTariffUseCase: serviceLocator(),
        getUserTariffsUseCase: serviceLocator())
      ..add(GetUserPackagesEvent())
      ..add(GetPackagesEvent());
    tabController = TabController(length: 2, vsync: this)
      ..addListener(
        () {
          isAddTariff.value = tabController.index == 1;
        },
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: tariffsBloc,
      child: Scaffold(
        appBar: AppBar(
          leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
            context.pop();
          }),
          title: Text(
            LocaleKeys.title_prices.tr(),
            style: context.textTheme.displaySmall,
          ),
          toolbarHeight: 64,
          surfaceTintColor: AppColors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                controller: tabController,
                tabs: [
                  Tab(
                    text: LocaleKeys.tab_seeAnnouncement.tr(),
                  ),
                  Tab(
                    text: LocaleKeys.tab_addAnnouncement.tr(),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            SeeAnnouncementTab(),
            AddAnnouncementTab(),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: isAddTariff,
          builder: (context, value, child) {
            if (value) {
              return Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: context.padding.bottom, top: 8),
                child: Column(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      text: LocaleKeys.btn_addAnnouncement.tr(),
                      height: 40,
                      onTap: () {},
                    ),
                    CustomButton.light(
                      text: LocaleKeys.btn_fillYourBalance.tr(),
                      height: 40,
                      onTap: () {},
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
