import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/core/util/thousands_formatter.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/common/presentation/widgets/drag_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/title_modal_widget.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/category_entity.dart';
import 'package:evo_med/features/estate_announcement/presentation/blocs/filter/filter_controller_bloc.dart';
import 'package:evo_med/features/services/presentation/widgets/list_tile_target.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

import '../blocs/estate_announcement/estate_announcement_bloc.dart';
import '../filter_similar/filter_label_utils.dart';
import '../../../common/domain/entity/location_entity.dart';

class MainFilterPage extends StatefulWidget {
  MainFilterPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<MainFilterPage> createState() => _MainFilterPageState();
}

class _MainFilterPageState extends State<MainFilterPage> {
  final ValueNotifier<RangeValues> rangeValues = ValueNotifier(RangeValues(0, 10000000000));

  final minController = TextEditingController();
  final maxController = TextEditingController();

  final currencyFormat = NumberFormat.currency(locale: 'en_US', symbol: '\$');

  @override
  void initState() {
    super.initState();
    final state = context.read<FilterControllerBloc>().state;

    final start = state.minPrice.clamp(0, 100000000);
    final end = state.maxPrice.clamp(0, 10000000000);

    rangeValues.value = RangeValues(start.toDouble(), end.toDouble());

    if (start > 0) {
    minController.text = state.minPrice.toInt().toString();
    }
    if (end > 0) {
      maxController.text = state.maxPrice.toInt().toString();
    }


    minController.addListener(() {
      final min = int.tryParse(minController.text.replaceAll(" ", "")) ?? 0;
      final current = rangeValues.value;
      // if (min <= current.end) {
        rangeValues.value = RangeValues(min.toDouble(), current.end);
      // }
    });

    maxController.addListener(() {
      final max = int.tryParse(maxController.text.replaceAll(" ", "")) ?? 0;
      final current = rangeValues.value;
      // if (max >= current.start) {
        rangeValues.value = RangeValues(current.start, max.toDouble());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DragWidget(),
        TitleModalWidget(
          title: LocaleKeys.title_filter.tr(),
          onCloseTap: () {
            context.pop();
          },
          onActionTap: () {
            context.read<FilterControllerBloc>().add(ClearFiltersEvent());
          },
        ),
        BlocBuilder<FilterControllerBloc, FilterControllerState>(
          builder: (context, state) {
            final currencySymbol = getCurrencySymbol(state.currency);
            final isUSD = state.currency == "usd";
            return Container(
              constraints: BoxConstraints(
                maxHeight: context.sizeOf.height * .65,
              ),
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  ListTileTarget(
                    title: LocaleKeys.title_estate.tr(),
                    label: buildCategoryLabel(context, state.selectedCategories),
                    onTab: () {
                      widget.pageController.jumpToPage(1);
                    },
                  ),
                  Divider(),
                  ListTileTarget(
                    title: LocaleKeys.title_region.tr(),
                    label: buildRegionLabel(context, state),
                    onTab: () {
                      widget.pageController.jumpToPage(2);
                    },
                  ),
                  Divider(),
                  Text(
                    LocaleKeys.title_price.tr(),
                    style: context.textTheme.bodyLarge,
                  ),
                  Gap(12),
                  Row(
                    spacing: 14,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: minController,
                          onChanged: (text) {},
                          labelText: LocaleKeys.hints_to.tr(),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [ThousandsSeparatorInputFormatter()],
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          controller: maxController,
                          onChanged: (text) {},
                          labelText: LocaleKeys.hints_from.tr(),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          inputFormatters: [ThousandsSeparatorInputFormatter()],
                        ),
                      )
                    ],
                  ),
                  Gap(24),
                  // ValueListenableBuilder<RangeValues>(
                  //   valueListenable: rangeValues,
                  //   builder: (context, value, child) {
                  //     WidgetsBinding.instance.addPostFrameCallback((_) {
                  //       final start = value.start.toInt().toString();
                  //       final end = value.end.toInt().toString();
                  //
                  //       if (minController.text != start) minController.text = start;
                  //       if (maxController.text != end) maxController.text = end;
                  //     });
                  //
                  //     return RangeSlider(
                  //       values: value,
                  //       min: 0,
                  //       max: maxPrice.toDouble(),
                  //       divisions: 1000,
                  //       labels: RangeLabels(
                  //         value.start.toInt().toString(),
                  //         value.end.toInt().toString(),
                  //       ),
                  //       onChanged: (values) {
                  //         rangeValues.value = values;
                  //       },
                  //     );
                  //   },
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "${0} sh.b",
                  //       style: context.textTheme.bodyMedium,
                  //     ),
                  //     Text(
                  //       "${maxPrice.priceFormat()} sh.b",
                  //       style: context.textTheme.bodyMedium,
                  //     ),
                  //   ],
                  // ),
                  // Gap(24),
                  ValueListenableBuilder<RangeValues>(
                    valueListenable: rangeValues,
                    builder: (context, value, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${value.start.toInt().priceFormat()} $currencySymbol – ${value.end.toInt().priceFormat()} $currencySymbol',
                            style: context.textTheme.headlineMedium!.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "sh.b",
                            style: context.textTheme.headlineSmall,
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: isUSD,
                              activeTrackColor: AppColors.primaryColor,
                              onChanged: (value) {
                                context.read<FilterControllerBloc>().add(
                                      SetCurrencyEvent(currency: value ? "usd" : "uzs"),
                                    );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
        Gap(16),
        Row(
          spacing: 16,
          children: [
            CustomButton.light(
              text: LocaleKeys.btn_close.tr(),
              onTap: () {
                context.pop();
              },
            ),
            BlocBuilder<EstateAnnouncementBloc, EstateAnnouncementState>(
              builder: (context, state) {
                return CustomButton(
                  isExpanded: true,
                  text: LocaleKeys.btn_applyFilter.tr(args: ["(${state.filterResultCount})"]),
                  onTap: () {
                    final min = double.tryParse(minController.text.replaceAll(" ", "")) ?? 0;
                    final max = double.tryParse(maxController.text.replaceAll(" ", "")) ?? 0;

                    context.read<FilterControllerBloc>().add(SetPriceRangeEvent(min: min, max: max));
                    final filterState = context.read<FilterControllerBloc>().state;

                    final selectedRegions = filterState.selectedSubRegions
                        .map((sub) => sub.parentId)
                        .toSet()
                        .map((parentId) {
                          return filterState.locations
                              .firstWhere(
                                (region) => region.id == parentId,
                                orElse: () => LocationEntity(),
                              )
                              .title
                              .titleByLocale;
                        })
                        .where((title) => title.isNotEmpty)
                        .toList();

                    context.read<EstateAnnouncementBloc>().add(
                          GetRealEstateAnnouncementEvent(
                            selectedCategories: filterState.selectedCategories.map((e) => e.id).toList(),
                            selectedRegions: selectedRegions,
                            selectedSubRegions: filterState.selectedSubRegions.map((e) => e.title.titleByLocale).toList(),
                            minPrice: min,
                            maxPrice: max,
                            currency: filterState.currency,
                          ),
                        );

                    context.pop();
                  },
                );
              },
            ),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    minController.dispose();
    maxController.dispose();
    rangeValues.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(Duration.zero, () {
      final filterState = context.read<FilterControllerBloc>().state;

      final selectedRegions = filterState.selectedSubRegions
          .map((sub) => sub.parentId)
          .toSet()
          .map((parentId) {
            return filterState.locations
                .firstWhere(
                  (region) => region.id == parentId,
                  orElse: () => LocationEntity(),
                )
                .title
                .titleByLocale;
          })
          .where((title) => title.isNotEmpty)
          .toList();

      final min = double.parse(minController.text.replaceAll(" ", ""));
      final max = double.parse(maxController.text.replaceAll(" ", ""));

      context.read<EstateAnnouncementBloc>().add(
            GetRealEstateAnnouncementCountEvent(
              selectedCategories: filterState.selectedCategories.map((e) => e.id).toList(),
              selectedRegions: selectedRegions,
              selectedSubRegions: filterState.selectedSubRegions.map((e) => e.title.titleByLocale).toList(),
              minPrice: min,
              maxPrice: max,
              currency: filterState.currency,
              count: true,
            ),
          );
    });
  }
}

String getCurrencySymbol(String currency) {
  switch (currency) {
    case "usd":
      return "\$";
    case "uzs":
      return "so'm";
    default:
      return currency;
  }
}
