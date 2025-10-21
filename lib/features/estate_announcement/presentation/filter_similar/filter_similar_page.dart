import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/common/presentation/widgets/list_tile_with_checkbox.dart';
import 'package:evo_med/features/services/presentation/widgets/list_tile_target.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class FilterSimilarPage extends StatefulWidget {
  const FilterSimilarPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<FilterSimilarPage> createState() => _FilterSimilarPageState();
}

class _FilterSimilarPageState extends State<FilterSimilarPage> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  List<String> priceList = [
    "Narx sh.b da",
    "Narx kelishiladi",
    "Ayriboshlash mumkin",
    "Nasiya savdo orqali",
    "Ipoteka",
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: LocaleKeys.title_filter.tr(),
      onLeadingTap: () {
        context.pop();
      },
      controlWidget:  CustomButton(
        text: LocaleKeys.btn_applyFilter.tr(args: [""]),
        onTap: () {
          context.pop();
        },
      ),
      content: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 56,
            child: TabBar(
              tabs: [
                Tab(
                  text: LocaleKeys.tab_general.tr(),
                ),
                Tab(
                  text: LocaleKeys.tab_location.tr(),
                ),
                Tab(
                  text: LocaleKeys.tab_price.tr(),
                ),
              ],
              controller: tabController,
            ),
          ),
          SizedBox(
            height: context.sizeOf.height * .6,
            child: TabBarView(
              controller: tabController,
              children: [
                ListView(
                  padding: EdgeInsets.only(
                    bottom: context.viewInsets.bottom,
                    top: 16,
                  ),
                  shrinkWrap: true,
                  children: [
                    CustomTextField(
                      controller: TextEditingController(),
                      onChanged: (value) {},
                      labelText: LocaleKeys.hints_numberOfRooms.tr(),
                    ),
                    Gap(16),
                    CustomTextField(
                      controller: TextEditingController(),
                      onChanged: (value) {},
                      labelText: LocaleKeys.hints_floor.tr(),
                    ),
                    Gap(16),
                    CustomTextField(
                      controller: TextEditingController(),
                      onChanged: (value) {},
                      labelText: LocaleKeys.hints_totalFloor.tr(),
                    ),
                    Gap(24),
                    ListTileTarget(
                      title: LocaleKeys.title_apartmentParams.tr(),
                      label: "Barcha parametrlar",
                      onTab: () {
                        widget.pageController.jumpToPage(1);
                      },
                    ),
                    Divider(height: 0),
                    ListTileTarget(
                      title: LocaleKeys.title_situation.tr(),
                      label: "Barcha holatlar",
                      onTab: () {
                        widget.pageController.jumpToPage(2);
                      },
                    ),
                    Divider(height: 0),
                    ListTileTarget(
                      title: LocaleKeys.title_communication.tr(),
                      label: "Barcha kommunikatsiyalar",
                      onTab: () {
                        widget.pageController.jumpToPage(3);
                      },
                    ),
                    Divider(height: 0),
                    ListTileTarget(
                      title: LocaleKeys.title_buildingMaterials.tr(),
                      label: "Barcha qurilish materiallari",
                      onTab: () {
                        widget.pageController.jumpToPage(4);
                      },
                    ),
                  ],
                ),
                ListView(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shrinkWrap: true,
                  children: [
                    ListTileTarget(
                      title: LocaleKeys.title_location.tr(),
                      label: "Barcha joylashuv o'rinlari",
                      onTab: () {},
                    ),
                    Divider(height: 0),
                    ListTileTarget(
                      title: LocaleKeys.title_nearSubway.tr(),
                      label: "Barcha metro stansiyalar",
                      onTab: () {},
                    ),
                  ],
                ),
                ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTileWithCheckBox(
                    title: priceList[index],
                    isChecked: false,
                    checkboxChanged: (value) {},
                  ),
                  itemCount: priceList.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
