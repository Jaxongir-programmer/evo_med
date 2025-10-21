import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_radio_button.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_text_field.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class SelectEstateForServiceModel extends StatelessWidget {
  SelectEstateForServiceModel({super.key});

  final List<String> dummyData = [
    "Kvartira, 98 m2, Ravnaq ko’chasi 12/4, Mirzo Ulug’bek tumani, Toshkent shaxri",
    "Kvartira, 18 m2, Turkiston ko’chasi 31/1, Shayxontoxur tumani, Toshkent shaxri",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.padding.bottom + context.viewInsets.bottom + 8, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 24,
            alignment: Alignment.center,
            child: Container(
              height: 5,
              width: 48,
              decoration: BoxDecoration(
                color: AppColors.dividerColor,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          SizedBox(
            height: 64,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  top: 0,
                  child: AppIcons.cross.toSVGWidget(
                    onTap: () {
                      context.pop();
                    },
                  ),
                ),
                Center(
                  child: Text(
                    LocaleKeys.title_selectEstate.tr(),
                    style: context.textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dummyData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              dummyData[index],
                              style: context.textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          CustomRadioButton(
                            value: false,
                            onChanged: (value) {},
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(height: 0),
                ),
                Divider(height: 0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          LocaleKeys.label_otherOption.tr(),
                          style: context.textTheme.bodyLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      CustomRadioButton(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  onChanged: (value) {},
                  height: 140,
                  minLines: 10,
                  maxLines: 15,
                  labelText: LocaleKeys.hints_estateAddress.tr(),
                  keyboardType: TextInputType.multiline,
                ),
                Gap(16),
              ],
            ),
          ),
          CustomButton(
            text: LocaleKeys.btn_confirm.tr(),
            onTap: () {
              context.pop();
            },
          )
        ],
      ),
    );
  }
}
