import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class UploadImagesScreen extends StatefulWidget {
  const UploadImagesScreen({super.key});

  @override
  State<UploadImagesScreen> createState() => _UploadImagesScreenState();
}

class _UploadImagesScreenState extends State<UploadImagesScreen> {
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
          LocaleKeys.title_uploadImages.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          Text(
            LocaleKeys.title_announcementMainImage.tr(),
            style: context.textTheme.bodyLarge,
          ),
          Gap(16),
          Row(
            spacing: 16,
            children: [
              CustomButton.light(
                onTap: () {},
                prefix: AppIcons.imageAdd.toSVGWidget(),
                text: LocaleKeys.btn_gallery.tr(),
                isExpanded: true,
              ),
              CustomButton.light(
                onTap: () {},
                prefix: AppIcons.camera.toSVGWidget(),
                text: LocaleKeys.btn_camera.tr(),
                isExpanded: true,
              )
            ],
          ),
          Divider(height: 50),
          Text(
            LocaleKeys.title_mainRoomPhoto.tr(),
            style: context.textTheme.bodyLarge,
          ),
          Gap(16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 88,
            alignment: Alignment.center,
            child: Text(
              LocaleKeys.label_imagesNoAdded.tr(),
              style: context.textTheme.bodyLarge!.copyWith(color: AppColors.labelColor),
            ),
          ),
          Gap(8),
          CustomButton.light(
            onTap: () {
              context.pushNamed(AppRouter.addImages);
            },
            prefix: AppIcons.imageAdd.toSVGWidget(),
            text: LocaleKeys.btn_addImages.tr(),
            isExpanded: true,
          ),
          Divider(height: 50),
          Text(
            LocaleKeys.title_otherPhotos.tr(),
            style: context.textTheme.bodyLarge,
          ),
          Gap(16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.containerBloc,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 88,
            alignment: Alignment.center,
            child: Text(
              LocaleKeys.label_imagesNoAdded.tr(),
              style: context.textTheme.bodyLarge!.copyWith(color: AppColors.labelColor),
            ),
          ),
          Gap(8),
          CustomButton.light(
            onTap: () {},
            prefix: AppIcons.imageAdd.toSVGWidget(),
            text: LocaleKeys.btn_addImages.tr(),
            isExpanded: true,
          ),
          Divider(height: 50),
          Text(
            LocaleKeys.title_planImages.tr(),
            style: context.textTheme.bodyLarge,
          ),
          Gap(16),
          Row(
            spacing: 16,
            children: [
              CustomButton.light(
                onTap: () {},
                prefix: AppIcons.imageAdd.toSVGWidget(),
                text: LocaleKeys.btn_gallery.tr(),
                isExpanded: true,
              ),
              CustomButton.light(
                onTap: () {},
                prefix: AppIcons.camera.toSVGWidget(),
                text: LocaleKeys.btn_camera.tr(),
                isExpanded: true,
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
          bottom: context.padding.bottom + 8,
        ),
        child: CustomButton(
          onTap: () {},
          text: LocaleKeys.btn_confirm.tr(),
        ),
      ),
    );
  }
}
