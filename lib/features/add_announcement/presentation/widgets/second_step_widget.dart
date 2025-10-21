import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/nearby_objects.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/common/presentation/widgets/show_modal_bottom_sheet.dart';
import 'package:evo_med/features/services/presentation/widgets/list_tile_target.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class SecondStepWidget extends StatelessWidget {
  const SecondStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
        bottom: context.padding.bottom + 16,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Ko'chmas mulk joylashuvi",
            style: context.textTheme.displaySmall,
          ),
        ),
        CustomButton.light(
          onTap: () {
            context.pushNamed(AppRouter.pointFromMap);
          },
          prefix: AppIcons.markerPin.toSVGWidget(
            color: AppColors.primaryColor,
            size: 24,
          ),
          text: LocaleKeys.btn_pointFromMap.tr(),
        ),
        Gap(16),
        ListTileTarget(
          title: LocaleKeys.title_pointNearbyObjects.tr(),
          onTab: () {
            CustomBottomSheet.showBottomSheet(
              context: context,
              content: NearbyObjects(),
            );
          },
        ),
        Gap(16),
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
      ],
    );
  }
}
