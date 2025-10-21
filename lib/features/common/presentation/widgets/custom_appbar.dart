import 'package:flutter/cupertino.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/drag_widget.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.leadingIcon,
    required this.onLeadingTap,
    required this.title,
    this.actionText,
    this.onActionTap,
  });

  final String? leadingIcon;
  final Function() onLeadingTap;
  final String title;
  final String? actionText;
  final Function()? onActionTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(88);
}
