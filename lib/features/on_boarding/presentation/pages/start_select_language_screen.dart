import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/core/util/map_indexed.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/on_boarding/presentation/widgets/locale_item.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class StartSelectLanguageScreen extends StatefulWidget {
  const StartSelectLanguageScreen({super.key});

  @override
  State<StartSelectLanguageScreen> createState() => _StartSelectLanguageScreenState();
}

class _StartSelectLanguageScreenState extends State<StartSelectLanguageScreen> {
  late double height;
  late Locale locale = supportedLocales[0];

  @override
  void initState() {
    height = 0;
    Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
      () {
        setState(() {
          height = 230;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hasThisLocale = supportedLocales.any((element) => element.languageCode == context.locale.languageCode);
    if (hasThisLocale) {
      locale = context.locale;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        child: Container(
          margin: EdgeInsets.only(
            bottom: context.padding.bottom + 8,
            left: 16,
            right: 16,
          ),
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LocaleKeys.label_select_language.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.displayMedium,
              ),
              const Gap(34),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: supportedLocales
                    .mapIndexed(
                      (e, i) => Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: i != 0 ? 6 : 0, right: (supportedLocales.length - 1) != i ? 6 : 0),
                          child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  context.setLocale(
                                      Locale.fromSubtags(languageCode: e.languageCode, scriptCode: e.scriptCode));
                                });

                                // final selectedLocale = "${e.languageCode}_${e.scriptCode}";
                                // final localeKey = selectedLocale == "ru_null"
                                //     ? "ru"
                                //     : selectedLocale == "uz_Latn"
                                //         ? "uz"
                                //         : "oz";
                                // await StorageRepository.putString(StoreKeys.language, localeKey);
                              },
                              child: LocaleItem(
                                  localeText: e.countryCode!,
                                  selectedItem: "${e.languageCode}_${e.scriptCode}" ==
                                      "${locale.languageCode}_${locale.scriptCode}")),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Gap(64),
              CustomButton(
                text: LocaleKeys.btn_continue.tr(),
                onTap: () {
                  context.goNamed(AppRouter.onBoarding);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
