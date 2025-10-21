import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/config/app_images.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class AddImagesScreen extends StatefulWidget {
  const AddImagesScreen({super.key});

  @override
  State<AddImagesScreen> createState() => _AddImagesScreenState();
}

class _AddImagesScreenState extends State<AddImagesScreen> {
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
          LocaleKeys.title_mainRoomPhoto.tr(),
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
          Gap(24),
          Expanded(
            child: GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 178,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              children: [
                AddImageItem(),
                AddImageItem(),
                AddImageItem(),
                AddImageItem(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
          bottom: context.padding.bottom + 8,
        ),
        child: Row(
          spacing: 8,
          children: [
            CustomButton.light(
              onTap: () {},
              text: LocaleKeys.btn_cancel.tr(),
              isExpanded: true,
            ),
            CustomButton(
              onTap: () {},
              text: LocaleKeys.btn_confirm.tr(),
              isExpanded: true,
            ),
          ],
        ),
      ),
    );
  }
}

class AddImageItem extends StatelessWidget {
  const AddImageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AppImages.photograpy,
                height: 121,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: CustomButton(
                onTap: () {},
                height: 32,
                width: 32,
                color: AppColors.dangerColor,
                child: AppIcons.trash.toSVGWidget(),
              ),
            )
          ],
        ),
        Gap(8),
        CustomTextField(
          controller: TextEditingController(),
          onChanged: (value) {},
          hintText: LocaleKeys.hints_title.tr(),
        )
      ],
    );
  }
}
