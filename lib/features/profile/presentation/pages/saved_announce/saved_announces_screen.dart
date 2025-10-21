import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/estate_detail/presentation/widgets/copy_phone_item_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class SavedAnnouncesScreen extends StatefulWidget {
  const SavedAnnouncesScreen({super.key});

  @override
  State<SavedAnnouncesScreen> createState() => _SavedAnnouncesScreenState();
}

class _SavedAnnouncesScreenState extends State<SavedAnnouncesScreen> {
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
        title: Text(
          LocaleKeys.title_boughtPackage.tr(),
          style: context.textTheme.displaySmall,
        ),
        centerTitle: true,
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
        actions: [
          AppIcons.calendarSmall.toSVGWidget(
            size: 32,
            color: AppColors.primaryColor,
          ),
          Gap(8),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: context.padding.bottom),
        children: [
          Text(
            LocaleKeys.label_foundBoughtAnnouncement.tr(args: ["1"]),
            style: context.textTheme.labelLarge,
          ),
          Gap(8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            child: BoughtAnnounceItemWidget(
              onTap: () {
                context.pushNamed(AppRouter.estateAnnounceDetail, extra: EstateType.apartment);
              },
              roomCount: 2,
              phoneNumber: "+998 99 999 99 99",
              address: "Tashkent, Yunusabad, 1-uy",
              tariffType: "Ekonom",
              tariffDate: "2023-10-01",
              tariffBoughtDate: "2023-10-01",
              price: "340 000 000",
              floor: "2",
              fullFloor: "5",
              area: "50",
            ),
          )
        ],
      ),
    );
  }
}

class BoughtAnnounceItemWidget extends StatelessWidget {
  const BoughtAnnounceItemWidget({
    super.key,
    required this.onTap,
    required this.roomCount,
    required this.phoneNumber,
    required this.address,
    required this.tariffType,
    required this.tariffDate,
    required this.tariffBoughtDate,
    required this.price,
    required this.floor,
    required this.fullFloor,
    required this.area,
  });

  final VoidCallback onTap;
  final int roomCount;
  final String phoneNumber;
  final String address;
  final String tariffType;
  final String tariffDate;
  final String tariffBoughtDate;
  final String price;
  final String floor;
  final String fullFloor;
  final String area;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.title_announcementDetail.tr(),
              style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
            ),
            StatusWidget.inactive()
          ],
        ),
        Gap(8),
        Row(
          spacing: 16,
          children: [
            Text(LocaleKeys.label_room.tr(args: ["$roomCount"]), style: context.textTheme.headlineSmall),
            SizedBox(height: 34, child: VerticalDivider()),
            Text("$area m²", style: context.textTheme.headlineSmall),
            SizedBox(height: 34, child: VerticalDivider()),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: LocaleKeys.label_floor.tr(args: [floor.toString()]),
                      style: context.textTheme.headlineSmall),
                  TextSpan(
                    text: "/${LocaleKeys.label_floor.tr(args: [fullFloor.tr()])}",
                    style: context.textTheme.headlineSmall!.copyWith(
                      color: AppColors.labelColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(8),
        CopyPhoneItemWidget(phoneNumber: phoneNumber),
        Divider(height: 30),
        Text(
          LocaleKeys.title_price.tr(),
          style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
        ),
        Gap(8),
        Text(
          LocaleKeys.label_uzs.tr(args: [price]),
          style: context.textTheme.bodyLarge,
        ),
        Gap(8),
        Text(
          LocaleKeys.title_address.tr(),
          style: context.textTheme.displaySmall!.copyWith(fontSize: 14),
        ),
        Gap(8),
        Text(
          address,
          style: context.textTheme.labelMedium,
        ),
        Gap(16),
        Text(
          LocaleKeys.title_packageType.tr(args: [tariffType]),
          style: context.textTheme.labelMedium,
        ),
        Text(
          tariffDate,
          style: context.textTheme.labelMedium!.copyWith(color: AppColors.labelColor),
        ),
        Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.label_dateBoughtAnnouncement.tr(),
                  style: context.textTheme.labelMedium,
                ),
                Text(
                  tariffBoughtDate,
                  style: context.textTheme.labelMedium!.copyWith(color: AppColors.labelColor),
                ),
              ],
            ),
            CustomButton.outline(
              height: 40,
              onTap: onTap,
              text: LocaleKeys.btn_inDetail.tr(),
            )
          ],
        )
      ],
    );
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget.active({
    super.key,
    this.status = LocaleKeys.label_active,
    this.color = AppColors.successGreen,
  });

  const StatusWidget.inactive({
    super.key,
    this.status = LocaleKeys.label_inActive,
    this.color = AppColors.inactiveBG,
  });

  const StatusWidget.deleted({
    super.key,
    this.status = LocaleKeys.label_deleted,
    this.color = AppColors.labelColor,
  });

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Text(
        status.tr(),
        style: context.textTheme.headlineSmall!.copyWith(color: AppColors.white),
      ),
    );
  }
}
