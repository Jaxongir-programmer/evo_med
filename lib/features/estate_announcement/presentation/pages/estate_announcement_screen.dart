import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/service_locator.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/announce_item/announcement_item_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/estate_announcement/presentation/blocs/estate_announcement/estate_announcement_bloc.dart';
import 'package:evo_med/features/estate_announcement/presentation/blocs/filter/filter_controller_bloc.dart';
import 'package:evo_med/features/estate_announcement/presentation/filters/filter_bottom_sheet.dart';
import 'package:evo_med/features/estate_announcement/presentation/filters/sort_bottom_sheet.dart';
import 'package:evo_med/features/estate_announcement/presentation/widgets/navigation_bottom_widget.dart';
import 'package:evo_med/features/estate_announcement/presentation/widgets/save_search_modal.dart';
import 'package:evo_med/features/saved/presentation/pages/saved_screen.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

import '../filter_similar/filter_similar_bottom_sheet.dart';

class EstateAnnouncementScreen extends StatefulWidget {
  const EstateAnnouncementScreen({super.key});

  @override
  State<EstateAnnouncementScreen> createState() => _EstateAnnouncementScreenState();
}

class _EstateAnnouncementScreenState extends State<EstateAnnouncementScreen> {
  late final EstateAnnouncementBloc estateAnnouncementBloc;
  late final FilterControllerBloc filterControllerBloc;

  @override
  void initState() {
    estateAnnouncementBloc = EstateAnnouncementBloc(
      estateAnnouncementUseCase: serviceLocator(),
      estateAnnouncementCountUseCase: serviceLocator(),
    )..add(GetRealEstateAnnouncementEvent());
    filterControllerBloc = FilterControllerBloc(
      getCategoriesUseCase: serviceLocator(),
      getLocationsUseCase: serviceLocator(),
      getAttributesUseCase: serviceLocator(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: estateAnnouncementBloc,
      child: Scaffold(
        appBar: AppBar(
          leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
            context.pop();
          }),
          title: Text(
            LocaleKeys.title_estateAnnouncement.tr(),
            style: context.textTheme.displaySmall,
          ),
          toolbarHeight: 64,
          surfaceTintColor: AppColors.white,
          actions: [
            CustomButton(
              onTap: () {
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
                    return SaveSearchModal();
                  },
                );
              },
              width: 48,
              color: Colors.transparent,
              child: AppIcons.saveBut.toSVGWidget(),
            )
          ],
        ),
        body: Column(
          children: [
            CustomButton(
              margin: EdgeInsets.symmetric(horizontal: 16),
              color: AppColors.borderColor,
              onTap: () {
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
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider.value(value: estateAnnouncementBloc),
                        BlocProvider.value(value: filterControllerBloc),
                      ],
                      child: FilterBottomSheet(),
                    );
                    // return BlocProvider.value(
                    //   value: filterControllerBloc,
                    //   child: FilterBottomSheet(),
                    // );
                  },
                );
              },
              child: Row(
                children: [
                  Badge(
                    smallSize: 10,
                    backgroundColor: AppColors.badgeColor,
                    child: AppIcons.filter.toSVGWidget(size: 22),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    LocaleKeys.label_filters.tr(args: ["Ko‘chmas mulk turi, hududi va narxi"]),
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Gap(8),
            BlocBuilder<EstateAnnouncementBloc, EstateAnnouncementState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        LocaleKeys.label_adsCount.tr(args: [state.realEstateAnnouncementList.length.toString()]),
                        style: context.textTheme.bodyMedium!.copyWith(color: AppColors.labelColor),
                      ),
                      const Spacer(),
                      Text(
                        "sh.b",
                        style: context.textTheme.headlineSmall,
                      ),
                      Gap(4),
                      Transform.scale(
                        scale: .8,
                        child: CupertinoSwitch(
                          value: false,
                          onChanged: (v) {},
                          activeTrackColor: AppColors.primaryColor,
                          inactiveTrackColor: AppColors.borderColor,
                        ),
                      ),
                      Gap(16),
                      CustomButton(
                        height: 40,
                        width: 40,
                        color: AppColors.containerBloc,
                        onTap: () {
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
                              return SortingResultModal();
                            },
                          );
                        },
                        child: AppIcons.arrowDownArrowUp.toSVGWidget(),
                      ),
                      Gap(16),
                      CustomButton(
                        height: 40,
                        width: 40,
                        color: AppColors.containerBloc,
                        onTap: () {
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
                              return MultiBlocProvider(
                                providers: [
                                  BlocProvider.value(value: estateAnnouncementBloc),
                                  BlocProvider.value(value: filterControllerBloc),
                                ],
                                child: FilterSimilarBottomSheet(),
                              );
                            },
                          );
                        },
                        child: AppIcons.sort.toSVGWidget(),
                      )
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: BlocBuilder<EstateAnnouncementBloc, EstateAnnouncementState>(
                builder: (context, state) {
                  return ListView.separated(
                    padding: EdgeInsets.all(16).copyWith(bottom: context.padding.bottom),
                    shrinkWrap: true,
                    itemCount: state.realEstateAnnouncementList.length,
                    itemBuilder: (context, index) {
                      final estateItem = state.realEstateAnnouncementList[index];
                      return AnnouncementItemWidget(
                        announcementId: estateItem.id,
                        imageList: estateItem.images,
                        //estateItem.images.main
                        price: estateItem.price.uzs,
                        address: estateItem.address.fullAddress,
                        roomNumbers: estateItem.roomCount,
                        area: estateItem.area,
                        floor: estateItem.floor,
                        totalFloor: estateItem.floorCount,
                        difference: 0,
                        activeDate: "",
                        saved: estateItem.isFavorite,
                        view: estateItem.views,
                        onTap: () {
                          // context.pushNamed(AppRouter.estateDetail, extra: EstateType.apartment);
                          context.pushNamed(AppRouter.estateAnnounceDetail, extra: EstateType.individualHouse);
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Gap(16),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBottomWidget(),
      ),
    );
  }
}
