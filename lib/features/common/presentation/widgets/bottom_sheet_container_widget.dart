import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/drag_widget.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
    required this.content,
    required this.title,
    required this.onLeadingTap,
    required this.controlWidget,
    this.leadingIcon,
    this.actionText,
    this.onActionTap,
  }) : assert(
          actionText == null || onActionTap != null,
          "actionText and onActionTap must be provided together",
        );

  final Widget controlWidget;
  final Widget content;
  final String? leadingIcon;
  final Function() onLeadingTap;
  final String title;
  final String? actionText;
  final Function()? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.viewInsets.bottom + context.padding.bottom + 8,
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DragWidget(),
          SizedBox(
            height: 64,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  top: 0,
                  child: (leadingIcon ?? AppIcons.cross).toSVGWidget(
                    onTap: () {
                      onLeadingTap();
                    },
                  ),
                ),
                Center(
                  child: Text(
                    title,
                    style: context.textTheme.displaySmall,
                  ),
                ),
                if (onActionTap != null && actionText != null)
                  Positioned(
                    bottom: 0,
                    top: 0,
                    right: 0,
                    child: CustomButton.transparent(
                      onTap: onActionTap!,
                      text: actionText!,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                  )
              ],
            ),
          ),
          Flexible(fit: FlexFit.loose, child: content),
          controlWidget
        ],
      ),
    );
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: context.viewInsets.bottom,
            left: 16,
            right: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DragWidget(),
              SizedBox(
                height: 64,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      top: 0,
                      child: (leadingIcon ?? AppIcons.cross).toSVGWidget(
                        onTap: () {
                          onLeadingTap();
                        },
                      ),
                    ),
                    Center(
                      child: Text(
                        title,
                        style: context.textTheme.displaySmall,
                      ),
                    ),
                    if (onActionTap != null && actionText != null)
                      Positioned(
                        bottom: 0,
                        top: 0,
                        right: 0,
                        child: CustomButton.transparent(
                          onTap: onActionTap!,
                          text: actionText!,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                      )
                  ],
                ),
              ),
              Flexible(fit: FlexFit.loose, child: content),
              controlWidget
            ],
          ),
        ),
        Positioned(left: 16, right: 16, bottom: context.padding.bottom, child: controlWidget),
      ],
    );
  }
}
