import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/home/domain/entities/nav_bar_entity.dart';

class NavItemWidget extends StatelessWidget {
  final NavigationBarModel navigationBarModel;
  final bool isSelected;
  final Function() onTap;

  const NavItemWidget({
    required this.navigationBarModel,
    this.isSelected = false,
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                                color: AppColors.dropColor.withOpacity(.25),
                                blurRadius: 18,
                                spreadRadius: 1,
                                offset: Offset(-1, 4))
                          ]
                        : []),
                child: navigationBarModel.icon.toSVGWidget(
                  size: 24,
                ),
              ),
              Text(
                navigationBarModel.title.tr(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: context.textTheme.titleSmall!.copyWith(
                  color: isSelectedColor(),
                ),
              ),
            ],
          ),
        ),
  );

  Color? isSelectedColor() => isSelected ? AppColors.selectedNavigation : AppColors.unSelectedNavigation;
}
