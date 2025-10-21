import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/core/util/formatter.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/features/services/presentation/widgets/select_estate_for_service_modal.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class OrderServiceScreen extends StatelessWidget {
  const OrderServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
            context.pop();
          }),
          title: Text(
            LocaleKeys.title_order.tr(),
            style: context.textTheme.displaySmall,
          ),
          toolbarHeight: 64,
          surfaceTintColor: AppColors.white,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: GestureDetector(
                onTap: () {
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
                behavior: HitTestBehavior.opaque,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.title_estate.tr(),
                            style: context.textTheme.bodyLarge,
                          ),
                          Text(
                            "98 m2, Ravnaq ko’chasi 12/4, Mirzo Ulug’bek tumani, Toshkent shaxri",
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: AppColors.hintColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    AppIcons.chevronRight.toSVGWidget(),
                  ],
                ),
              ),
            ),
            Gap(16),
            Text(
              LocaleKeys.title_selectedServices.tr(),
              style: context.textTheme.displaySmall,
            ),
            Gap(16),
            Container(
              decoration: BoxDecoration(color: AppColors.containerBloc, borderRadius: BorderRadius.circular(8)),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    title: Text("Videoobzor (+360)", style: context.textTheme.headlineMedium),
                    subtitle: Text("200 000 so’mdan boshlab", style: context.textTheme.labelMedium),
                    trailing: CustomButton(
                      height: 32,
                      width: 32,
                      onTap: () {},
                      borderRadius: 9,
                      child: AppIcons.trash.toSVGWidget(size: 18),
                    ),
                  ),
                  Divider(indent: 16, endIndent: 16),
                  ListTile(
                    title: Text("Remont", style: context.textTheme.headlineMedium),
                    subtitle: Text("40 000 so’mdan boshlab", style: context.textTheme.labelMedium),
                    trailing: CustomButton(
                      height: 32,
                      width: 32,
                      onTap: () {},
                      borderRadius: 9,
                      child: AppIcons.trash.toSVGWidget(size: 18),
                    ),
                  ),
                ],
              ),
            ),
            Gap(32),
            Text(
              LocaleKeys.title_numberForContact.tr(),
              style: context.textTheme.displaySmall,
            ),
            Gap(16),
            CustomTextField(
              prefix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(16),
                  AppIcons.flagUz.toSVGWidget(),
                  Gap(4),
                  Text(
                    '+998',
                    style: context.textTheme.bodyLarge,
                  ),
                  Gap(12)
                ],
              ),
              contentPadding: EdgeInsets.only(top: 4),
              inputFormatters: [
                LengthLimitingTextInputFormatter(12),
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                Formatters.phoneFormatter(mask: "## ### ## ##", initialText: ''),
              ],
              keyboardType: TextInputType.phone,
              hintText: "00 000 00 00",
              controller: TextEditingController(),
              onChanged: (String value) {},
            ),
          ],
        ),
        bottomNavigationBar: CustomButton(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ).copyWith(
            bottom: context.padding.bottom + 8,
          ),
          text: LocaleKeys.btn_confirm.tr(),
          onTap: () {
            context.pushNamed(AppRouter.orderServicesSuccess, extra: SuccessType.newPassword);
          },
        ),
      ),
    );
  }
}
