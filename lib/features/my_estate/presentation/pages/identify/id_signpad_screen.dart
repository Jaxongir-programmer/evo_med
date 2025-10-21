import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:myid/enums.dart';
import 'package:myid/myid.dart';
import 'package:myid/myid_config.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class IdSignPadScreen extends StatefulWidget {
  const IdSignPadScreen({super.key});

  @override
  State<IdSignPadScreen> createState() => _IdSignPadScreenState();
}

class _IdSignPadScreenState extends State<IdSignPadScreen> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  bool _isSigned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          context.pop();
        }),
        title: Text(
          LocaleKeys.title_writeSignature.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: context.sizeOf.height * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SfSignaturePad(
                      onDrawStart: _handleOnDrawStart,
                      key: signatureGlobalKey,
                      backgroundColor: Colors.white,
                      strokeColor: Colors.black,
                      minimumStrokeWidth: 1.0,
                      maximumStrokeWidth: 4.0),
                ),
              ),
              Gap(16),
              IntrinsicWidth(
                child: CustomButton.outline(
                  onTap: () {
                    _handleClearButtonPressed();
                  },
                  prefix: AppIcons.refresh.toSVGWidget(),
                  text: LocaleKeys.btn_clear.tr(),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: CustomButton(
        text: LocaleKeys.btn_confirm.tr(),
        onTap: () async {
          if (_isSigned) {
            var result = await MyIdClient.start(
              config: MyIdConfig(
                clientId: "sdfg84bsggv84xsad8fx4",
                // clientHash: "clientHash",
                environment: MyIdEnvironment.DEBUG,
              ),
              iosAppearance: MyIdIOSAppearance(),
            );
            print(result.base64);
            // context.pushNamed(AppRouter.successScreen, extra: SuccessType.identification);
          } else {
            context.showSnackBar(
              "Imzo qo'yish zarur",
            );
          }
        },
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  bool _handleOnDrawStart() {
    _isSigned = true;
    return false;
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
    _isSigned = false;
  }

  Future<Uint8List?> signatureBytes() async {
    final data = await signatureGlobalKey.currentState!.toImage(pixelRatio: 2.0);
    final byteData = await data.toByteData(format: ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  void dispose() {
    signatureGlobalKey.currentState!.dispose();
    super.dispose();
  }
}
