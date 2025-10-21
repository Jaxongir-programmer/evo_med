import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/checkbox_list.dart';
import 'package:evo_med/features/common/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/common/presentation/widgets/list_tile_with_checkbox.dart';
import 'package:evo_med/features/common/presentation/widgets/show_modal_bottom_sheet.dart';
import 'package:evo_med/features/services/presentation/widgets/list_tile_target.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart' show StringTranslateExtension, tr;

class NearbyObjects extends StatefulWidget {
  const NearbyObjects({
    super.key,
  });

  @override
  State<NearbyObjects> createState() => _NearbyObjectsState();
}

class _NearbyObjectsState extends State<NearbyObjects> {
  int activeIndex = 0;

  final List<String> dummyList = [
    "Bog'cha",
    "Maktab",
    "Oliygoh",
    "Poliklinika",
    "Kasalxona",
    "Boshqa tibbiyot muassasalari",
  ];

  final List<String> dummyList2 = [
    "Teatr va kinoteatrlar",
    "Konsert zal",
    "Park",
    "Hayvonot bog'i",
    "Sayilgohlar",
    "Tarixiy obidalar",
    "Ko'ngil ochar markazlar"
  ];

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: LocaleKeys.title_nearbyObjects.tr(),
      leadingIcon: AppIcons.chevronLeft,
      onLeadingTap: () {
        context.pop();
      },
      controlWidget: CustomButton(
        text: LocaleKeys.btn_confirm.tr(),
        onTap: () {
          context.pop(activeIndex);
        },
      ),
      content: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 24, bottom: 40),
        children: [
          Text(
            LocaleKeys.title_socialObjects.tr(),
            style: context.textTheme.displaySmall,
          ),
          Gap(16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return ListTileWithCheckBox(
                title: dummyList[index],
                isChecked: false,
                checkboxChanged: (value) {},
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 4);
            },
            itemCount: dummyList.length,
          ),
          Gap(24),
          Text(
            LocaleKeys.title_transportInfo.tr(),
            style: context.textTheme.displaySmall,
          ),
          Gap(16),
          ListTileWithCheckBox(
            title: "Avtobus bekati",
            isChecked: false,
            checkboxChanged: (value) {},
          ),
          Divider(height: 4),
          ListTileTarget(
            title: "Metro",
            onTab: () {
              CustomBottomSheet.showBottomSheet(
                context: context,
                content: CheckBoxList(
                  title: "Metro",
                  list: [
                    "Chilonzor",
                    "Oqtepa",
                    "Yunusobod",
                    "Mirzo Ulug'bek",
                    "Bodomzor",
                    "Mirobod",
                    "Mustaqillik maydoni",
                    "Xalqlar do'stligi",
                    "Alisher Navoiy",
                    "Toshkent",
                  ],
                ),
              );
            },
          ),
          Divider(height: 4),
          ListTileWithCheckBox(
            title: "Aeroport",
            isChecked: false,
            checkboxChanged: (value) {},
          ),
          Divider(height: 4),
          ListTileWithCheckBox(
            title: "Temiryo'l stansiyasi",
            isChecked: false,
            checkboxChanged: (value) {},
          ),
          Gap(24),
          Text(
            LocaleKeys.title_commercialInfrostructure.tr(),
            style: context.textTheme.displaySmall,
          ),
          Gap(16),
          ListTileTarget(
            title: "Dexqon bozor",
            onTab: () {},
          ),
          Divider(height: 4),
          ListTileTarget(
            title: "Qurilish mollari bozori",
            onTab: () {},
          ),
          Gap(8),
          CustomTextField(
            controller: TextEditingController(),
            onChanged: (value) {},
          ),
          Gap(16),
          CustomTextField(
            controller: TextEditingController(),
            onChanged: (value) {},
          ),

          /// Entertainment objects
          Gap(24),
          Text(
            LocaleKeys.title_entertainmentObjects.tr(),
            style: context.textTheme.displaySmall,
          ),
          Gap(16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return ListTileWithCheckBox(
                title: dummyList2[index],
                isChecked: false,
                checkboxChanged: (value) {},
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 4);
            },
            itemCount: dummyList2.length,
          ),
          CustomTextField(
            controller: TextEditingController(),
            onChanged: (value) {},
            hintText: LocaleKeys.hints_write.tr(),
          ),
        ],
      ),
    );
  }
}
