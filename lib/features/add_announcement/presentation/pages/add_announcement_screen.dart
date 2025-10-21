import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/add_announcement/presentation/dialog/send_to_moderation_bottom_sheet.dart';
import 'package:evo_med/features/add_announcement/presentation/widgets/first_step_widget.dart';
import 'package:evo_med/features/add_announcement/presentation/widgets/second_step_widget.dart';
import 'package:evo_med/features/add_announcement/presentation/widgets/third_step_widget.dart';
import 'package:evo_med/features/common/domain/entity/step_item_data_entity.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/show_modal_bottom_sheet.dart';
import 'package:evo_med/features/common/presentation/widgets/steps_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class AddAnnouncementScreen extends StatefulWidget {
  const AddAnnouncementScreen({super.key});

  @override
  State<AddAnnouncementScreen> createState() => _AddAnnouncementScreenState();
}

class _AddAnnouncementScreenState extends State<AddAnnouncementScreen> {
  late final PageController pageController;
  final ValueNotifier<int> currentStep = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    pageController = PageController()
      ..addListener(
        () {
          currentStep.value = pageController.page!.round();
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
            context.pop();
          }),
          title: Text(
            LocaleKeys.title_putPropertyForSale.tr(),
            style: context.textTheme.displaySmall,
          ),
          toolbarHeight: 64,
          surfaceTintColor: AppColors.white,
        ),
        body: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: currentStep,
              builder: (context, value, child) => Steps(
                activeIndex: value,
                steps: [
                  StepsItemData(
                    title: LocaleKeys.label_step.tr(args: ["1"]),
                    successIcon: AppIcons.circleCheck,
                    content: LocaleKeys.label_infos.tr(),
                  ),
                  StepsItemData(
                    title: LocaleKeys.label_step.tr(args: ["2"]),
                    successIcon: AppIcons.circleCheck,
                    content: LocaleKeys.label_location.tr(),
                  ),
                  StepsItemData(
                    title: LocaleKeys.label_step.tr(args: ["3"]),
                    successIcon: AppIcons.circleCheck,
                    content: LocaleKeys.label_price.tr(),
                  )
                ],
              ),
            ),
            Gap(8),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  FirstStepWidget(),
                  SecondStepWidget(),
                  ThirdStepWidget(),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              CustomButton(
                onTap: () {
                  CustomBottomSheet.showBottomSheet(
                    context: context,
                    content: SentToModeration(),
                  );
                },
                text: LocaleKeys.btn_continue.tr(),
              ),
              CustomButton.outline(
                onTap: () {},
                text: LocaleKeys.btn_addToDraft.tr(),
              )
            ],
          ),
        ),
      ),
    );
  }
}