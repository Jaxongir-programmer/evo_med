import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_images.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/services/presentation/widgets/custom_tab_bar.dart';
import 'package:evo_med/features/services/presentation/widgets/select_estate_for_service_modal.dart';
import 'package:evo_med/features/services/presentation/widgets/service_item_widget.dart';
import 'package:evo_med/features/services/presentation/widgets/list_tile_target.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class EstateServicesTab extends StatefulWidget {
  const EstateServicesTab({
    super.key,
  });

  @override
  State<EstateServicesTab> createState() => _EstateServicesTabState();
}

class _EstateServicesTabState extends State<EstateServicesTab> with SingleTickerProviderStateMixin {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Gap(16),
          ListTileTarget(
            title: LocaleKeys.title_estate.tr(),
            label: "Turkiston ko’chasi, 98 m2, ko’p qavatli turar joy..",
            onTab: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                isScrollControlled: true,
                useSafeArea: true,
                builder: (context) {
                  return SelectEstateForServiceModel();
                },
              );
            },
          ),
          Gap(16),
          CustomTabBar(pageController: pageController),
          Gap(16),
          Flexible(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    ServiceItemWidget(
                      title: "Sug’urta xizmatlari",
                      label: "Narxi kelishilgan holatda",
                      image: AppImages.insurance,
                      onInfoTap: () {
                        context.pushNamed(AppRouter.servicesAboutServices, extra: "Sug’urta xizmatlari");
                      },
                      onAddTap: () {},
                    ),
                    Gap(18),
                    ServiceItemWidget(
                      title: "Ishonchli boshqarish",
                      label: "Narxi kelishilgan holatda",
                      image: AppImages.control,
                      onInfoTap: () {
                        context.pushNamed(AppRouter.servicesAboutServices, extra: "Ishonchli boshqarish");
                      },
                      onAddTap: () {},
                    ),
                    Gap(18),
                    ServiceItemWidget(
                      title: "Ishonchli boshqarish",
                      label: "Narxi kelishilgan holatda",
                      image: AppImages.control,
                      onInfoTap: () {
                        context.pushNamed(AppRouter.servicesAboutServices, extra: "Ishonchli boshqarish");
                      },
                      onAddTap: () {},
                    ),
                    Gap(18),
                    ServiceItemWidget(
                      title: "Ishonchli boshqarish",
                      label: "Narxi kelishilgan holatda",
                      image: AppImages.control,
                      onInfoTap: () {
                        context.pushNamed(AppRouter.servicesAboutServices, extra: "Ishonchli boshqarish");
                      },
                      onAddTap: () {},
                    ),
                  ],
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.containerBloc,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: "“Sotishga tayyorlash” bo’limidagi xizmatlarga buyurtma bersangiz, e’loningiz "),
                          TextSpan(
                            text: "bepul joylashtirib beriladi.",
                            style: context.textTheme.labelLarge!.copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                          ),
                        ]),
                        style: context.textTheme.labelLarge!.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Gap(18),
                    ServiceItemWidget(
                      title: "Bozor narxini baxolash",
                      label: "200 000 so’mdan boshlab",
                      image: AppImages.prising,
                      onInfoTap: () {
                        context.pushNamed(AppRouter.servicesAboutServices, extra: "Bozor narxini baxolash");
                      },
                      onAddTap: () {},
                    ),
                    Gap(18),
                    ServiceItemWidget(
                      title: "Fotoobzor",
                      label: "40 000 so’mdan boshlab",
                      image: AppImages.photograpy,
                      onInfoTap: () {
                        context.pushNamed(AppRouter.servicesAboutServices, extra: "Fotoobzor");
                      },
                      onAddTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
