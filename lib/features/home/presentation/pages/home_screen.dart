import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/config/app_images.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/service_locator.dart';
import 'package:evo_med/core/services/shared_preference_manager.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/auth/presentation/dialog/login_dialog.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/home/presentation/blocs/home/home_bloc.dart';
import 'package:evo_med/features/home/presentation/dialog/login_dialog.dart';
import 'package:evo_med/features/home/presentation/widgets/home_ads_widget.dart';
import 'package:evo_med/features/home/presentation/widgets/home_app_bar_title.dart';
import 'package:evo_med/features/home/presentation/widgets/home_navigation_widget.dart';
import 'package:evo_med/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();

    homeBloc = HomeBloc(
      getHomeInfoUseCase: serviceLocator(),
    )..add(GetHomeServicesEvent());
  }

  List<String> dummyImages = [
    AppImages.dummy1,
    AppImages.dummy2,
    AppImages.dummy1,
    AppImages.dummy2,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeBloc,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackground,
          surfaceTintColor: AppColors.scaffoldBackground,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          clipBehavior: Clip.none,
          centerTitle: false,
          title: const HomeAppBarTitle(),
          actions: [
            CustomButton.border(
              onTap: () {
                if (context.read<ProfileBloc>().state.profile.id != 0) {
                  context.pushNamed(AppRouter.myEstates);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return LoginDialog();
                    },
                  );
                }
              },
              height: 30,
              textStyle: context.textTheme.headlineSmall!.copyWith(
                color: AppColors.white,
              ),
              text: LocaleKeys.btn_myEstates.tr(),
            ),
            Gap(8),
            AppIcons.notification.toSVGWidget(
              size: 48,
              onTap: () {
                context.pushNamed(AppRouter.messages);
              },
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.only(bottom: 12, top: 16),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.title_home.tr(),
                        style: context.textTheme.displayMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                          dummyImages.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: index == 2 ? AppColors.dotActiveGray : AppColors.dotInactive,
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(12),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          dummyImages[index],
                          width: 203,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    itemCount: dummyImages.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Gap(16);
                    },
                  ),
                ),
                Gap(32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Text(
                        LocaleKeys.title_adsFromEstateOwners.tr(),
                        style: context.textTheme.displaySmall,
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          return Row(
                            spacing: 16,
                            children: [
                              HomeAdsWidget(
                                title: LocaleKeys.label_selling.tr(),
                                label: LocaleKeys.label_adsCount
                                    .tr(args: [state.homeStatisticEntity.estate.sale.count.toString()]),
                                image: AppImages.sellEstate,
                                onTap: () {
                                  context.pushNamed(AppRouter.estateAnnouncement);
                                },
                              ),
                              HomeAdsWidget(
                                title: LocaleKeys.label_renting.tr(),
                                label: LocaleKeys.label_adsCount
                                    .tr(args: [state.homeStatisticEntity.estate.rent.count.toString()]),
                                image: AppImages.rentEstate,
                                onTap: () {},
                              ),
                            ],
                          );
                        },
                      ),
                      IntrinsicWidth(
                        child: CustomButton(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          onTap: () {},
                          height: 30,
                          color: AppColors.white,
                          textColor: AppColors.defaultDark,
                          textStyle: context.textTheme.headlineSmall,
                          border: Border.all(color: AppColors.borderColor),
                          text: LocaleKeys.btn_serviceForEstates.tr(),
                        ),
                      )
                    ],
                  ),
                ),
                Gap(32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Text(
                        LocaleKeys.title_adsFromCarOwners.tr(),
                        style: context.textTheme.displaySmall,
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          return Row(
                            spacing: 16,
                            children: [
                              HomeAdsWidget(
                                title: LocaleKeys.label_selling.tr(),
                                label: LocaleKeys.label_adsCount
                                    .tr(args: [state.homeStatisticEntity.car.sale.count.toString()]),
                                image: AppImages.sellCar,
                                onTap: () {},
                              ),
                              HomeAdsWidget(
                                title: LocaleKeys.label_renting.tr(),
                                label: state.homeStatisticEntity.car.rent.isActive
                                    ? LocaleKeys.label_adsCount
                                        .tr(args: [state.homeStatisticEntity.car.rent.count.toString()])
                                    : LocaleKeys.label_soon.tr(),
                                image: AppImages.rentCar,
                                onTap: () {},
                              ),
                            ],
                          );
                        },
                      ),
                      IntrinsicWidth(
                        child: CustomButton(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          onTap: () {},
                          height: 30,
                          color: AppColors.white,
                          textColor: AppColors.defaultDark,
                          textStyle: context.textTheme.headlineSmall,
                          border: Border.all(color: AppColors.borderColor),
                          text: LocaleKeys.btn_serviceForCars.tr(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: HomeNavigationWidget(),
      ),
    );
  }
}
