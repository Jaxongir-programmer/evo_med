import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/domain/entity/location_entity.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/drag_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/list_tile_with_checkbox.dart';
import 'package:evo_med/features/common/presentation/widgets/title_modal_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

import '../../../common/presentation/widgets/shimmer_widget.dart';
import '../blocs/filter/filter_controller_bloc.dart';
import '../filter_similar/filter_label_utils.dart';

class FilterRegionPage extends StatefulWidget {
  FilterRegionPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<FilterRegionPage> createState() => _FilterRegionPageState();
}

class _FilterRegionPageState extends State<FilterRegionPage> {
  // final List<String> regions = [
  //   "Barcha Respublika",
  //   "Toshkent sh.",
  //   "Toshkent viloyati",
  //   "",
  //   "Samarqand viloyati",
  //   "Farg'ona viloyati",
  //   "Andijon viloyati",
  //   "Namangan viloyati",
  //   "Jizzax viloyati",
  //   "Sirdaryo viloyati",
  //   "Surxondaryo viloyati",
  //   "Qashqadaryo viloyati",
  //   "Buxoro viloyati",
  //   "Xorazm viloyati",
  //   "Navoiy viloyati",
  //   "Qoraqalpog'iston Respublikasi",
  // ];

  @override
  void initState() {
    super.initState();
    context.read<FilterControllerBloc>().add(
          GetRegionsEvent(
            parentId: 0,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    print("region");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DragWidget(),
        TitleModalWidget(
          title: LocaleKeys.title_provinces.tr(),
          onCloseTap: () {
            context.pop();
          },
          onActionTap: () {},
        ),
        Container(
            constraints: BoxConstraints(maxHeight: context.sizeOf.height * .65),
            child: BlocBuilder<FilterControllerBloc, FilterControllerState>(
              builder: (context, state) {
                if (state.locationsStatus.isSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final location = state.locations[index];

                      bool isFirstInactive = !state.locations.sublist(0, index).any((e) => !e.isActive) && !location.isActive;

                      final selectedCount = state.selectedSubRegions.where((sub) => sub.parentId == location.id).length;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isFirstInactive)
                            Container(
                              margin: EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                                color: AppColors.containerBloc,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "Viloyatlar bo’ylab faoliyatimiz tez orada yo’lga qo’yiladi.",
                                style: context.textTheme.labelMedium,
                              ),
                            ),
                          GestureDetector(
                            onTap: () {
                              if (location.isActive) {
                                widget.pageController.jumpToPage(3);
                                context.read<FilterControllerBloc>().add(GetRegionsEvent(parentId: location.id));
                              }
                            },
                            behavior: HitTestBehavior.opaque,
                            child: SizedBox(
                              height: 56,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          location.title.titleByLocale,
                                          style: context.textTheme.bodyMedium!.copyWith(
                                            color: location.isActive ? AppColors.defaultDark : AppColors.labelColor,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        if (selectedCount > 0)
                                          Text(
                                            buildSubRegionLabel(context, state.selectedSubRegions),
                                            style: context.textTheme.bodyMedium!.copyWith(
                                              color: AppColors.hintColor,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                      ],
                                    ),
                                  ),
                                  selectedCount > 0
                                      ? AppIcons.tick.toSVGWidget()
                                      : AppIcons.chevronRight
                                          .toSVGWidget(color: location.isActive ? AppColors.defaultDark : null),
                                  // if (index == 0)
                                  //   AppIcons.tick.toSVGWidget()
                                  // else
                                  //   AppIcons.chevronRight.toSVGWidget(color: location.isActive ? AppColors.defaultDark : null),
                                ],
                              ),
                            ),
                          ),
                          if (!location.isActive) Divider(height: 0)
                        ],
                      );
                    },
                    itemCount: state.locations.length,
                  );
                } else {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: ShimmerWidget(
                            height: 22,
                            width: Random().nextInt(200).clamp(40, 100).toDouble(),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(height: 0);
                      },
                      itemCount: 10);
                }
              },
            )),
        Gap(16),
        Row(
          spacing: 16,
          children: [
            CustomButton.light(
              text: LocaleKeys.btn_back.tr(),
              onTap: () {
                widget.pageController.jumpToPage(0);
              },
            ),
            CustomButton(
              isExpanded: true,
              text: LocaleKeys.btn_confirm.tr(args: [""]),
              onTap: () {
                widget.pageController.jumpToPage(0);
              },
            ),
          ],
        )
      ],
    );
  }
}

class FilterSubRegionPage extends StatefulWidget {
  FilterSubRegionPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<FilterSubRegionPage> createState() => _FilterSubRegionPageState();
}

class _FilterSubRegionPageState extends State<FilterSubRegionPage> {
  List<LocationEntity> _subRegions = [];

  // final List<String> subRegions = [
  //   "Butun Toshkent viloyati",
  //   "Olmaliq shahri",
  //   "Chirchiq shahri",
  //   "Yunusobod tumani",
  //   "Yakkasaroy tumani",
  //   "Sergeli tumani",
  //   "Mirzo Ulug'bek tumani",
  //   "Uchtepa tumani",
  //   "Bektemir tumani",
  //   "Yashnobod tumani",
  // ];

  @override
  void initState() {
    _subRegions = [...context.read<FilterControllerBloc>().state.selectedSubRegions];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("sub region");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DragWidget(),
        TitleModalWidget(
          title: LocaleKeys.title_districts.tr(),
          onCloseTap: () {
            context.pop();
          },
          onActionTap: () {},
        ),
        Container(
          constraints: BoxConstraints(maxHeight: context.sizeOf.height * .65),
          child: BlocBuilder<FilterControllerBloc, FilterControllerState>(
            builder: (context, state) {
              if (state.locationsStatus.isSuccess) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index >= state.subRegions.length) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: ShimmerWidget(
                          height: 22,
                          width: Random().nextInt(200).clamp(40, 100).toDouble(),
                        ),
                      );
                    }
                    final subRegion = state.subRegions[index];
                    final fixedSubRegion = subRegion.copyWith(parentId: state.currentParentId ?? 0);

                    return ListTileWithCheckBox(
                      title: subRegion.title.uz,
                      isChecked: state.selectedSubRegions.contains(fixedSubRegion),
                      checkboxChanged: (value) {
                        if (value) {
                          context.read<FilterControllerBloc>().add(AddSubRegionEvent(subRegion: fixedSubRegion));
                        } else {
                          context.read<FilterControllerBloc>().add(RemoveSubRegionEvent(subRegion: subRegion));
                        }
                        // if (value) {
                        //   _subRegions.add(subRegion);
                        // } else {
                        //   _subRegions.remove(subRegion);
                        // }
                        // setState(() {});
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(height: 0);
                  },
                  itemCount: state.subRegions.length,
                );
              } else {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: ShimmerWidget(
                          height: 22,
                          width: Random().nextInt(200).clamp(40, 100).toDouble(),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 0);
                    },
                    itemCount: 10);
              }
            },
          ),
        ),
        Gap(16),
        Row(
          spacing: 16,
          children: [
            CustomButton.light(
              isExpanded: true,
              text: LocaleKeys.btn_toRegions.tr(),
              onTap: () {
                widget.pageController.jumpToPage(2);
              },
            ),
            CustomButton(
              isExpanded: true,
              text: LocaleKeys.btn_confirm.tr(args: [""]),
              onTap: () {
                widget.pageController.jumpToPage(2);
              },
            ),
          ],
        )
      ],
    );
  }
}
