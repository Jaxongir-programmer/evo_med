import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/drag_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/title_modal_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

import '../../../common/presentation/widgets/list_tile_with_checkbox.dart';

List<String> apartmentParametres = [
  "Torets",
  "Uglovoy",
  "Podval",
  "Mansarda",
  "Bog' bor",
  "Parkovka uchun joy",
  "Mebelli",
  "Fasad",
];

List<String> situations = [
  "Zamonaviy",
  "Eski",
  "Toza",
];

List<String> communal = [
  "Elektr",
  "Gaz",
  "Sovuq suv",
  "Issiq suv (markazlashtirilgan)",
  "Issiq suv (kotyol)",
  "Kanalizatsiya",
  "Internet",
];

List<String> buildingMaterials = [
  "G'isht",
  "Biton",
  "Gazablok",
  "Panelli beton (lego panellar)",
  "Boshqa"
];

class FilterSimilarApartmentParamsPage extends StatelessWidget {
  const FilterSimilarApartmentParamsPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DragWidget(),
        TitleModalWidget(
          title: LocaleKeys.title_apartmentParams.tr(),
          leadingIcon: AppIcons.chevronLeft,
          onCloseTap: () {
            pageController.jumpToPage(0);
          },
        ),
        Container(
          constraints: BoxConstraints(maxHeight: context.sizeOf.height * .65),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTileWithCheckBox(
                title: apartmentParametres[index],
                isChecked: false,
                checkboxChanged: (value) {},
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 0);
            },
            itemCount: apartmentParametres.length,
          ),
        ),
        Gap(16),
        CustomButton(
          text: LocaleKeys.btn_confirm.tr(),
          onTap: () {
            pageController.jumpToPage(0);
          },
        ),
      ],
    );
  }
}

class FilterSimilarSituationPage extends StatelessWidget {
  const FilterSimilarSituationPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DragWidget(),
        TitleModalWidget(
          title: LocaleKeys.title_situation.tr(),
          leadingIcon: AppIcons.chevronLeft,
          onCloseTap: () {
            pageController.jumpToPage(0);
          },
        ),
        Container(
          constraints: BoxConstraints(maxHeight: context.sizeOf.height * .65),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTileWithCheckBox(
                title: situations[index],
                isChecked: false,
                checkboxChanged: (value) {},
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 0);
            },
            itemCount: situations.length,
          ),
        ),
        Gap(16),
        CustomButton(
          text: LocaleKeys.btn_confirm.tr(),
          onTap: () {
            pageController.jumpToPage(0);
          },
        ),
      ],
    );
  }
}

class FilterSimilarCommunicationPage extends StatelessWidget {
  const FilterSimilarCommunicationPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DragWidget(),
        TitleModalWidget(
          title: LocaleKeys.title_communication.tr(),
          leadingIcon: AppIcons.chevronLeft,
          onCloseTap: () {
            pageController.jumpToPage(0);
          },
        ),
        Container(
          constraints: BoxConstraints(maxHeight: context.sizeOf.height * .65),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTileWithCheckBox(
                title: communal[index],
                isChecked: false,
                checkboxChanged: (value) {},
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 0);
            },
            itemCount: communal.length,
          ),
        ),
        Gap(16),
        CustomButton(
          text: LocaleKeys.btn_confirm.tr(),
          onTap: () {
            pageController.jumpToPage(0);
          },
        ),
      ],
    );
  }
}

class FilterSimilarBuildingMaterialPage extends StatelessWidget {
  const FilterSimilarBuildingMaterialPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DragWidget(),
        TitleModalWidget(
          title: LocaleKeys.title_buildingMaterials.tr(),
          leadingIcon: AppIcons.chevronLeft,
          onCloseTap: () {
            pageController.jumpToPage(0);
          },
        ),
        Container(
          constraints: BoxConstraints(maxHeight: context.sizeOf.height * .65),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTileWithCheckBox(
                title: buildingMaterials[index],
                isChecked: false,
                checkboxChanged: (value) {},
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 0);
            },
            itemCount: buildingMaterials.length,
          ),
        ),
        Gap(16),
        CustomButton(
          text: LocaleKeys.btn_confirm.tr(),
          onTap: () {
            pageController.jumpToPage(0);
          },
        ),
      ],
    );
  }
}
