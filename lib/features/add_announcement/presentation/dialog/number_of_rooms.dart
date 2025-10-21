import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class NumberOfRooms extends StatefulWidget {
  const NumberOfRooms({
    super.key,
  });

  @override
  State<NumberOfRooms> createState() => _NumberOfRoomsState();
}

class _NumberOfRoomsState extends State<NumberOfRooms> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: LocaleKeys.title_numberOfRooms.tr(),
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
      content: Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 40),
        child: SizedBox(
          height: 72,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(
                    () {
                      activeIndex = index;
                    },
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: activeIndex == index ? AppColors.primaryColor : AppColors.containerBloc,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  width: 72,
                  child: Text(
                    "${index + 1}",
                    style: context.textTheme.displaySmall!.copyWith(
                      color: activeIndex == index ? AppColors.white : null,
                    ),
                  ),
                ),
              );
            },
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) => Gap(8),
          ),
        ),
      ),
    );
  }
}
