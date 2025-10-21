import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_decoration.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/home/domain/entities/nav_bar_entity.dart';
import 'package:evo_med/features/home/presentation/widgets/nav_bar_item.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class HomeNavigationWidget extends StatelessWidget {
  HomeNavigationWidget({super.key});

  final List<NavigationBarModel> navLabels = [
    NavigationBarModel(
      title: LocaleKeys.navigation_home,
      index: 0,
      icon: AppIcons.homeSelected,
    ),
    NavigationBarModel(
      title: LocaleKeys.navigation_selected,
      index: 1,
      icon: AppIcons.likedUnselected,
    ),
    NavigationBarModel(
      title: LocaleKeys.navigation_services,
      index: 2,
      icon: AppIcons.servicesUnselected,
    ),
    NavigationBarModel(
      title: LocaleKeys.navigation_settings,
      index: 3,
      icon: AppIcons.settings,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58 + context.padding.bottom,
      padding: EdgeInsets.only(bottom: context.padding.bottom, left: 16, right: 16),
      decoration: BoxDecoration(
        color: context.appBarTheme.backgroundColor,
        boxShadow: AppDecoration.shadowLow8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavItemWidget(
            isSelected: true,
            navigationBarModel: navLabels[0],
            onTap: () {},
          ),
          NavItemWidget(
            navigationBarModel: navLabels[1],
            onTap: () {
              context.pushNamed(AppRouter.saved);
            },
          ),
          NavItemWidget(
            navigationBarModel: navLabels[2],
            onTap: () {
              context.pushNamed(AppRouter.services);
            },
          ),
          NavItemWidget(
            navigationBarModel: navLabels[3],
            onTap: () {
              context.pushNamed(AppRouter.profile);
            },
          ),
        ],
      ),
    );
  }
}
