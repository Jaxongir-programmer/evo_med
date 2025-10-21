import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/additional_amenities.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/additional_info.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/apartment_detail.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/building_materials.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/floor_modal_sheet.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/infrostructure.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/number_of_resident_floor.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/number_of_rooms.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/repair_and_equipment.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/common/presentation/widgets/show_modal_bottom_sheet.dart';
import 'package:evo_med/features/services/presentation/widgets/list_tile_target.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class FirstStepWidget extends StatelessWidget {
  const FirstStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
        bottom: context.padding.bottom + 16,
      ),
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.containerBloc,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mulk turi: Ko’p qavatli turar joy",
                style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
              ),
              Gap(8),
              Text(
                "Toshkent viloyati, Toshkent shaxri, Yashnobod tumani, Buyuk turon ko’chasi, 33-uy 4-xonadon",
                style: context.textTheme.bodyMedium!.copyWith(color: AppColors.labelColor),
              ),
              Gap(8),
              Text(
                "98 m2",
                style: context.textTheme.bodyMedium!.copyWith(color: AppColors.labelColor),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            LocaleKeys.title_generalInfo.tr(),
            style: context.textTheme.displaySmall,
          ),
        ),
        ListTileTarget(
          title: LocaleKeys.title_floor.tr(),
          onTab: () {
            CustomBottomSheet.showBottomSheet(
              context: context,
              content: FloorModalSheet(),
            );
          },
        ),
        Divider(),
        ListTileTarget(
          title: LocaleKeys.title_numberOfRooms.tr(),
          onTab: () {
            CustomBottomSheet.showBottomSheet(
              context: context,
              content: NumberOfRooms(),
            );
          },
        ),
        Divider(),
        ListTileTarget(
          title: LocaleKeys.title_numberOfResidentFloor.tr(),
          onTab: () {
            CustomBottomSheet.showBottomSheet(
              context: context,
              content: NumberOfResidentFloor(),
            );
          },
        ),
        Divider(),
        ListTileTarget(
          title: LocaleKeys.title_buildingMaterials.tr(),
          onTab: () {
            CustomBottomSheet.showBottomSheet(
              context: context,
              content: BuildingMaterialsBottomSheet(),
            );
          },
        ),
        Divider(),
        ListTileTarget(
          title: LocaleKeys.title_apartmentBuildingType.tr(),
          onTab: () {
            CustomBottomSheet.showBottomSheet(
              context: context,
              content: AdditionalInfoBottomSheet(),
            );
          },
        ),
        Gap(16),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            LocaleKeys.title_additionalInfo.tr(),
            style: context.textTheme.displaySmall,
          ),
        ),
        ListTileTarget(
          title: LocaleKeys.title_apartmentDetails.tr(),
          onTab: () {
            CustomBottomSheet.showBottomSheet(
              context: context,
              content: ApartmentDetailBottomSheet(),
            );
          },
        ),
        Divider(),
        ListTileTarget(
          title: LocaleKeys.title_repairAndEquipment.tr(),
          onTab: () {
            CustomBottomSheet.showBottomSheet(
              context: context,
              content: RepairAndEquipmentBottomSheet(),
            );
          },
        ),
        Divider(),
        ListTileTarget(
          title: LocaleKeys.title_infrostructure.tr(),
          onTab: () {
            CustomBottomSheet.showBottomSheet(
              context: context,
              content: InfrostructureBottomSheet(),
            );
          },
        ),
        Divider(),
        ListTileTarget(
          title: LocaleKeys.title_additionalAmenities.tr(),
          onTab: () {
            CustomBottomSheet.showBottomSheet(
              context: context,
              content: AdditionalAmenitiesBottomSheet(),
            );
          },
        ),
        Gap(16),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            LocaleKeys.title_additionalInfo.tr(),
            style: context.textTheme.displaySmall,
          ),
        ),
        CustomTextField(
          controller: TextEditingController(),
          contentPadding: EdgeInsets.all(16),
          onChanged: (value) {},
          hintText: LocaleKeys.hints_writeAdditionalInfo.tr(),
          keyboardType: TextInputType.multiline,
          height: 140,
          minLines: 10,
          maxLines: 15,
        ),
        Gap(16),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            LocaleKeys.title_video360.tr(),
            style: context.textTheme.displaySmall,
          ),
        ),
        CustomButton.light(
          onTap: () {
            context.pushNamed(AppRouter.uploadImages);
          },
          prefix: AppIcons.imageAdd.toSVGWidget(),
          text: LocaleKeys.btn_upload.tr(),
        )
      ],
    );
  }
}
