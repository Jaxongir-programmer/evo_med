import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/config/app_images.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/announce_item/announcement_item_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/estate_detail_item_widget.dart';
import 'package:evo_med/features/estate_detail/presentation/dialog/not_enough_balance_bottom_sheet.dart';
import 'package:evo_med/features/estate_detail/presentation/widgets/contact_info_widget.dart';
import 'package:evo_med/features/estate_detail/presentation/widgets/text_with_tick_item_widget.dart';
import 'package:evo_med/features/saved/presentation/pages/saved_screen.dart';

import '../../../../generated/locale_keys.g.dart';

class EstateAnnounceDetailScreen extends StatefulWidget {
  const EstateAnnounceDetailScreen({
    super.key,
    required this.estateType,
  });

  final EstateType estateType;

  @override
  State<EstateAnnounceDetailScreen> createState() => _EstateAnnounceDetailScreenState();
}

class _EstateAnnounceDetailScreenState extends State<EstateAnnounceDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          context.pop();
        }),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
        actions: [
          CustomButton(
            onTap: () {
              /// First time tariff dialog
              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return FirstTimeTariffDialog();
              //   },
              // );

              /// When have tariff
              // showModalBottomSheet(
              //   context: context,
              //   backgroundColor: AppColors.white,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(16),
              //       topRight: Radius.circular(16),
              //     ),
              //   ),
              //   builder: (context) {
              //     return TariffChargedBottomSheet();
              //   },
              // );

              /// When Tariff not applied
              // showModalBottomSheet(
              //   context: context,
              //   backgroundColor: AppColors.white,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(16),
              //       topRight: Radius.circular(16),
              //     ),
              //   ),
              //   builder: (context) {
              //     return BuyingTariffBottomSheet();
              //   },
              // );

              /// When Tariff applied but not enough balance
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                builder: (context) {
                  return NotEnoughBalanceBottomSheet();
                },
              );
            },
            width: 40,
            height: 40,
            color: AppColors.buttonPrimaryLight,
            child: AppIcons.triangleWarning.toSVGWidget(),
          ),
          Gap(12),
          CustomButton(
            onTap: () {},
            width: 40,
            height: 40,
            color: AppColors.buttonPrimaryLight,
            child: AppIcons.layerThree.toSVGWidget(),
          ),
          Gap(12),
          CustomButton(
            onTap: () {},
            width: 40,
            height: 40,
            color: AppColors.buttonPrimaryLight,
            child: AppIcons.share.toSVGWidget(),
          ),
          Gap(16)
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
          bottom: context.padding.bottom + 16,
        ),
        children: [
          ///  Main image
          AnnouncementItemWidget(
            announcementId: 0,
            imageList: [],
            price: 340000000,
            address: "Tashkent, Yunusabad, 1st block",
            roomNumbers: 3,
            area: 120,
            floor: 2,
            totalFloor: 5,
            difference: 2,
            saved: true,
            view: 567,
            onTap: () {},
          ),

          /// Contact info
          ContactInfoWidget(
            phoneNumber: "+998 99 123 45 67",
            regionDistrict: "Toshkent, Yunusobod tumani",
            address: "Yunusobod tumani, 1-mavze",
            estateDetailInfo: "1998-yil qurilgan, lift mavjud",
          ),

          /// General info
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            child: Text(
              LocaleKeys.title_basicInfo.tr(),
              style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EstateDetailItemWidget(
                  title: LocaleKeys.title_id.tr(),
                  label: "213 345 432",
                ),
                Divider(height: 25),
                EstateDetailItemWidget(
                  title: LocaleKeys.title_type.tr(),
                  label: widget.estateType.isApartment
                      ? "Ko'p qavatli turar joy"
                      : widget.estateType.isIndividualHouse
                          ? "Individual turar joy"
                          : widget.estateType.isUnsettledHouse
                              ? "Noturar joy"
                              : widget.estateType.isEmptyLand
                                  ? "Bo'sh joy"
                                  : "Boshqa",
                ),
                if (widget.estateType.isIndividualHouse || widget.estateType.isUnsettledHouse) ...[
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_numberOfGates.tr(),
                    label: "1",
                  )
                ],
                if (widget.estateType.isUnsettledHouse) ...[
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_businessType.tr(),
                    label: "Ofis",
                  )
                ],
                if (widget.estateType.isEmptyLand) ...[
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_emptyLandInfo.tr(),
                    label: "1998-yil qurilgan, 1-liniya",
                  ),
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_additionalInfo.tr(),
                    label: "Kadastr toza",
                  )
                ],
                if (widget.estateType.isApartment ||
                    widget.estateType.isUnsettledHouse ||
                    widget.estateType.isIndividualHouse) ...[
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_buildingMaterials.tr(),
                    label: "Gazablok",
                  ),
                ],
                if (widget.estateType.isApartment) ...[
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_estateDetailInfo.tr(),
                    label: "1998-yil qurilgan, lift mavjud",
                  ),
                ],
                if (widget.estateType.isIndividualHouse) ...[
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_buildStyle.tr(),
                    label: "Klassik",
                  )
                ],
                if (widget.estateType.isOtherLand) ...[
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_infoAboutProperty.tr(),
                    label: "Kadastr toza",
                  )
                ],
              ],
            ),
          ),

          /// 360
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 16),
            child: Text(
              widget.estateType.isApartment
                  ? LocaleKeys.title_apartmentWith360.tr()
                  : widget.estateType.isIndividualHouse
                      ? LocaleKeys.title_individualWith360.tr()
                      : widget.estateType.isUnsettledHouse
                          ? LocaleKeys.title_unSettledWith360.tr()
                          : widget.estateType.isEmptyLand
                              ? LocaleKeys.title_emptyLandPhoto.tr()
                              : LocaleKeys.title_otherPhotos.tr(),
              style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.estateType.isApartment ||
                    widget.estateType.isIndividualHouse ||
                    widget.estateType.isUnsettledHouse) ...[
                  Text(
                    LocaleKeys.title_mainRoomPhoto.tr(),
                    style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
                  ),
                  Gap(12),
                  // SizedBox(
                  //   height: 90,
                  //   child: ListView.separated(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: imageList.length,
                  //     separatorBuilder: (context, index) => Gap(8),
                  //     itemBuilder: (context, index) {
                  //       return Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         spacing: 8,
                  //         children: [
                  //           Container(
                  //             height: 66,
                  //             width: 95,
                  //             decoration: BoxDecoration(
                  //               color: AppColors.white,
                  //               borderRadius: BorderRadius.circular(5),
                  //               image: DecorationImage(
                  //                   image: AssetImage(
                  //                     imageList[index],
                  //                   ),
                  //                   fit: BoxFit.cover),
                  //             ),
                  //           ),
                  //           Text("Balkon", style: context.textTheme.labelMedium)
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),
                  Divider(height: 25),
                  Text(
                    LocaleKeys.title_apartmentPlan.tr(),
                    style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
                  ),
                  Gap(12),
                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      separatorBuilder: (context, index) => Gap(8),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 90,
                          width: 112,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(
                                AppImages.dummy_plan,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(height: 25),
                  Text(
                    LocaleKeys.title_otherPhotos.tr(),
                    style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
                  ),
                  Gap(12),
                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      separatorBuilder: (context, index) => Gap(8),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Container(
                              height: 66,
                              width: 95,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(
                                      AppImages.slider_dummy2,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Text("Balkon", style: context.textTheme.labelMedium)
                          ],
                        );
                      },
                    ),
                  ),
                  Divider(height: 25),
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_video360.tr(),
                    underlineText: LocaleKeys.title_open.tr(),
                    onTap: () {},
                  ),
                ] else
                  SizedBox(
                    height: 66,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      separatorBuilder: (context, index) => Gap(8),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 66,
                          width: 95,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(
                                AppImages.slider_dummy2,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),

          /// Additional info
          if (!widget.estateType.isOtherLand) ...[
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 16),
              child: Text(
                LocaleKeys.title_additionalInfo.tr(),
                style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.containerBloc,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.estateType.isApartment ||
                      widget.estateType.isIndividualHouse ||
                      widget.estateType.isUnsettledHouse) ...[
                    EstateDetailItemWidget(
                      title: widget.estateType.isApartment
                          ? LocaleKeys.title_apartmentDetails.tr()
                          : widget.estateType.isIndividualHouse
                              ? LocaleKeys.title_individualBuildingInfo.tr()
                              : widget.estateType.isUnsettledHouse
                                  ? LocaleKeys.title_unsettledPlaceInfo.tr()
                                  : "",
                      label: "Torets, balkon, studiya",
                    ),
                    if (widget.estateType.isApartment ||
                        widget.estateType.isIndividualHouse ||
                        widget.estateType.isUnsettledHouse) ...[
                      Divider(height: 25),
                      EstateDetailItemWidget(
                        title: LocaleKeys.title_houseLayout.tr(),
                        label: "2ta Mehmonxona, 1ta oshxona, 1ta hammom, 1ta xojatxona",
                      ),
                    ],
                    Divider(height: 25),
                    EstateDetailItemWidget(
                      title: LocaleKeys.title_repairAndEquipment.tr(),
                      label: "Remonttalab, mebelsiz",
                    ),
                    Divider(height: 25),
                  ],
                  EstateDetailItemWidget(
                    title: LocaleKeys.title_infrostructure.tr(),
                    label: "Elektr ta’minoti, gaz ta’minoti, issiq suv (markazlashgan), sovuq suv, kanalizatsiya",
                  ),
                  if (widget.estateType.isApartment ||
                      widget.estateType.isIndividualHouse ||
                      widget.estateType.isUnsettledHouse) ...[
                    Divider(height: 25),
                    EstateDetailItemWidget(
                      title: LocaleKeys.title_additionalAmenities.tr(),
                      label: "Shaxsiy avtoturargoh, bolalar o’yingohi",
                    ),
                  ]
                ],
              ),
            )
          ],

          /// Location info
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            child: Text(
              LocaleKeys.title_locationAddress.tr(),
              style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EstateDetailItemWidget(
                  title: LocaleKeys.title_nearbyObjects.tr(),
                  label: "Maktab, supermarket",
                ),
              ],
            ),
          ),

          /// Price info
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            child: Text(
              LocaleKeys.title_priceInfo.tr(),
              style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWithTickItemWidget(title: "Narx kelishiladi"),
                Divider(height: 25),
                TextWithTickItemWidget(title: "Ayrboshlash mumkin"),
                Divider(height: 25),
                TextWithTickItemWidget(title: "Nasiya savdo orqali "),
                Divider(height: 25),
                TextWithTickItemWidget(title: "Ipoteka"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
