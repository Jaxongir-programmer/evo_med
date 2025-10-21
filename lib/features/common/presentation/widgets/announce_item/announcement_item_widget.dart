import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/announce_item/active_control_widgets.dart';
import 'package:evo_med/features/common/presentation/widgets/announce_item/inactive_control_widgets.dart';
import 'package:evo_med/features/common/presentation/widgets/announce_item/moderation_control_widgets.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_imageview.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/media_item_entity.dart';
import 'package:evo_med/features/estate_announcement/presentation/filter_similar/filter_similar_bottom_sheet.dart';
import 'package:evo_med/features/saved/presentation/blocs/saved/saved_bloc.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class AnnouncementItemWidget extends StatefulWidget {
  const AnnouncementItemWidget({
    super.key,
    required this.imageList,
    required this.price,
    required this.address,
    required this.roomNumbers,
    required this.area,
    required this.floor,
    required this.totalFloor,
    required this.difference,
    required this.saved,
    required this.view,
    required this.onTap,
    this.activeDate,
    this.onDelete,
    this.onPlayPause,
    this.onEdit,
    this.onResent,
    this.onCancel,
    this.announcementId = -1,
    this.status = AnnouncementStatus.initial,
  });

  final List<MediaItemEntity> imageList;
  final int price;
  final int announcementId;
  final String address;
  final int roomNumbers;
  final double area;
  final int floor;
  final int totalFloor;
  final int difference;
  final bool saved;
  final int view;
  final Function() onTap;
  final String? activeDate;
  final Function()? onDelete;
  final Function()? onPlayPause;
  final Function()? onEdit;
  final Function()? onResent;
  final Function()? onCancel;
  final AnnouncementStatus status;

  factory AnnouncementItemWidget.active({
    required List<MediaItemEntity> imageList,
    required String address,
    required int price,
    required int roomNumbers,
    required double area,
    required int floor,
    required int totalFloor,
    required int difference,
    required bool saved,
    required int view,
    required Function() onTap,
    required String activeDate,
    required Function() onDelete,
    required Function() onPlayPause,
    required Function() onEdit,
  }) {
    return AnnouncementItemWidget(
      imageList: imageList,
      price: price,
      address: address,
      roomNumbers: roomNumbers,
      area: area,
      floor: floor,
      totalFloor: totalFloor,
      difference: difference,
      saved: saved,
      view: view,
      onTap: onTap,
      activeDate: activeDate,
      onDelete: onDelete,
      onPlayPause: onPlayPause,
      onEdit: onEdit,
      status: AnnouncementStatus.active,
    );
  }

  factory AnnouncementItemWidget.moderation({
    required List<MediaItemEntity> imageList,
    required String address,
    required int price,
    required int roomNumbers,
    required double area,
    required int floor,
    required int totalFloor,
    required int difference,
    required bool saved,
    required int view,
    required Function() onTapAnnouncement,
    required String activeDate,
    required Function() onTapCancelModeration,
    required Function() onTapResentToModeration,
    required Function() onTapDelete,
    required Function() onTapChangeDetails,
    AnnouncementStatus status = AnnouncementStatus.inModeration,
  }) {
    return AnnouncementItemWidget(
      imageList: imageList,
      price: price,
      address: address,
      roomNumbers: roomNumbers,
      area: area,
      floor: floor,
      totalFloor: totalFloor,
      difference: difference,
      saved: saved,
      view: view,
      onTap: onTapAnnouncement,
      activeDate: activeDate,
      onDelete: onTapDelete,
      onEdit: onTapChangeDetails,
      onResent: onTapResentToModeration,
      onCancel: onTapCancelModeration,
      status: status,
    );
  }

  factory AnnouncementItemWidget.inActive({
    required List<MediaItemEntity> imageList,
    required String address,
    required int price,
    required int roomNumbers,
    required double area,
    required int floor,
    required int totalFloor,
    required int difference,
    required bool saved,
    required int view,
    required Function() onTapAnnouncement,
    required String activeDate,
    required Function() onTapDelete,
    required Function() onTapChangeDetails,
    required Function() onTapActive,
    AnnouncementStatus status = AnnouncementStatus.inActive,
  }) {
    return AnnouncementItemWidget(
      imageList: imageList,
      price: price,
      address: address,
      roomNumbers: roomNumbers,
      area: area,
      floor: floor,
      totalFloor: totalFloor,
      difference: difference,
      saved: saved,
      view: view,
      onTap: onTapAnnouncement,
      activeDate: activeDate,
      onDelete: onTapDelete,
      onEdit: onTapChangeDetails,
      onPlayPause: onTapActive,
      status: status,
    );
  }

  @override
  State<AnnouncementItemWidget> createState() => _AnnouncementItemWidgetState();
}

class _AnnouncementItemWidgetState extends State<AnnouncementItemWidget> {
  late final CarouselController carouselController;
  final ValueNotifier<int> currentPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    carouselController = CarouselController()
      ..addListener(() {
        final position = carouselController.position;
        final width = context.sizeOf.width - 32; //your width
        if (position.hasPixels) {
          final index = (position.pixels / width).round().clamp(0, 100);
          currentPage.value = index;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Main container
        GestureDetector(
          onTap: widget.onTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsets.zero,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 152,
                  child: Stack(
                    children: [
                      CarouselView(
                        padding: EdgeInsets.zero,
                        itemSnapping: true,
                        enableSplash: false,
                        scrollDirection: Axis.horizontal,
                        itemExtent: context.sizeOf.width - 32,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        controller: carouselController,
                        children: widget.imageList
                            .map(
                              (e) => CustomImageView(
                                imageUrl: e.url,
                                fit: BoxFit.cover,
                              ),
                            )
                            .toList(),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 0,
                        left: 0,
                        child: ValueListenableBuilder(
                          valueListenable: currentPage,
                          builder: (context, value, child) => DotsIndicator(
                            dotsCount: widget.imageList.length,
                            position: value.toDouble(),
                            decorator: DotsDecorator(
                              activeColor: AppColors.dotInactive,
                              color: AppColors.dotActiveGray,
                              size: Size(8, 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4,
                          children: [
                            if (widget.status.isInitial || widget.status.isActive) ...[
                              CustomButton(
                                onTap: () {},
                                height: 22,
                                borderRadius: 4,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                color: AppColors.dark70,
                                child: Row(
                                  spacing: 4,
                                  children: [
                                    AppIcons.view.toSVGWidget(),
                                    Text(
                                      widget.view.priceFormat(),
                                      style: context.textTheme.labelMedium!.copyWith(color: AppColors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            Spacer(),

                            /// Show expired date if the announcement is active
                            if (widget.status.isActive) ActiveDayWidget(day: widget.activeDate!),

                            /// Show date of sent to moderation if the announcement is in moderation
                            if (widget.status.isInModeration) ModerationDayWidget(day: widget.activeDate!),

                            /// if announcement is usual then show the buttons
                            if (widget.status.isInitial) ...[
                              CustomButton(
                                onTap: () {},
                                height: 48,
                                width: 48,
                                color: AppColors.dark70,
                                child: AppIcons.c360.toSVGWidget(),
                              ),
                              BlocBuilder<SavedBloc, SavedState>(
                                builder: (context, state) {
                                  return CustomButton(
                                    onTap: () {
                                      if (state.savedAnnouncementsList.any(
                                        (element) => element.id == widget.announcementId,
                                      )) {
                                        context.read<SavedBloc>().add(
                                              DeleteAnnounceFromSavedEvent(announcementId: widget.announcementId),
                                            );
                                      } else {
                                        context.read<SavedBloc>().add(
                                              AddAnnounceToSavedEvent(announcementId: widget.announcementId),
                                            );
                                      }
                                    },
                                    height: 48,
                                    width: 48,
                                    color: AppColors.dark70,
                                    child: Builder(
                                      builder: (_) {
                                        if (state.savedAnnouncementsList.any(
                                          (element) => element.id == widget.announcementId,
                                        )) {
                                          return AppIcons.heartFilled.toSVGWidget();
                                        } else {
                                          return AppIcons.heartOut.toSVGWidget();
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                            ]
                          ],
                        ),
                      ),

                      /// this is according to the announcement bought status
                      // Positioned(
                      //   bottom: 8,
                      //   left: 8,
                      //   child: StatusWidget.active(),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 2,
                              children: [
                                Text(
                                  LocaleKeys.label_uzs.tr(args: [widget.price.priceFormat()]),
                                  style: context.textTheme.displaySmall,
                                ),
                                Text(
                                  widget.address,
                                  style: context.textTheme.labelMedium!.copyWith(
                                    color: AppColors.labelColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),

                          /// Show filter button if the announcement is usual
                          if (widget.status.isInitial)
                            CustomButton(
                              height: 32,
                              color: Colors.transparent,
                              onTap: () {
                              //
                              },
                              child: Row(
                                spacing: 4,
                                children: [
                                  Text(
                                    LocaleKeys.label_similar.tr(),
                                    style: context.textTheme.displaySmall!
                                        .copyWith(color: AppColors.primaryColor, fontSize: 12),
                                  ),
                                  AppIcons.same.toSVGWidget(),
                                ],
                              ),
                            )
                        ],
                      ),
                      Gap(12),
                      Divider(height: 0),
                      Row(
                        spacing: 16,
                        children: [
                          Text(LocaleKeys.label_room.tr(args: [widget.roomNumbers.toString()]),
                              style: context.textTheme.headlineSmall),
                          SizedBox(height: 34, child: VerticalDivider()),
                          Text("${widget.area} m²", style: context.textTheme.headlineSmall),
                          SizedBox(height: 34, child: VerticalDivider()),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: LocaleKeys.label_floor.tr(args: [widget.floor.toString()]),
                                    style: context.textTheme.headlineSmall),
                                TextSpan(
                                  text: "/${LocaleKeys.label_floor.tr(args: [widget.totalFloor.toString()])}",
                                  style: context.textTheme.headlineSmall!.copyWith(
                                    color: AppColors.labelColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(2),
                      Row(
                        children: [
                          if (widget.difference != 0)
                            Text(
                              LocaleKeys.label_expensiveThanUsual.tr(args: [widget.difference.toString()]),
                              style: context.textTheme.labelSmall!.copyWith(
                                fontSize: 11,
                                color: AppColors.labelColor,
                              ),
                            ),
                          Spacer(),
                          CustomButton(
                            height: 34,
                            color: Colors.transparent,
                            onTap: () {},
                            text: LocaleKeys.btn_inDetail.tr(),
                            textColor: AppColors.primaryColor,
                            textStyle: context.textTheme.titleSmall!.copyWith(
                                decoration: TextDecoration.underline, decorationColor: AppColors.primaryColor),
                          )
                        ],
                      ),
                      if (widget.status.isInModerationCanceled) ModerationCanceledInfo(onEdit: widget.onEdit!),
                      if (widget.status.isInActive) InActiveInfoWidget()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        /// If the announcement is active then show controllers
        if (widget.status.isActive)
          ActiveControl(
            onDelete: widget.onDelete ?? () {},
            onPlayPause: widget.onPlayPause ?? () {},
            onEdit: widget.onEdit ?? () {},
          ),

        if (widget.status.isInModeration)
          ModerationInfoWidget(
            onCancel: () {},
          ),
        if (widget.status.isInModerationCanceled)
          ModerationCanceledControl(
            onDelete: widget.onDelete ?? () {},
            onResent: widget.onResent ?? () {},
          ),

        if (widget.status.isInActive)
          InActiveControl(
            onDelete: widget.onDelete ?? () {},
            onEdit: widget.onEdit ?? () {},
            onActive: widget.onPlayPause ?? () {},
          ),
      ],
    );
  }
}
