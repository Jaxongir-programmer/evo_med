import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';

class ServiceItemWidget extends StatefulWidget {
  const ServiceItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.label,
    required this.onInfoTap,
    required this.onAddTap,
  });

  final String image;
  final String title;
  final String label;
  final Function() onInfoTap;
  final Function() onAddTap;

  @override
  State<ServiceItemWidget> createState() => _ServiceItemWidgetState();
}

class _ServiceItemWidgetState extends State<ServiceItemWidget> {
  bool added = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.containerBloc,
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(widget.image),
        ),
      ),
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (added)
            AnimatedContainer(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.successGreen,
                borderRadius: BorderRadius.circular(8),
              ),
              duration: Duration(milliseconds: 400),
              child: AppIcons.tick.toSVGWidget(
                color: AppColors.white,
              ),
            ),
          Spacer(),
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    widget.title,
                    style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
                  ),
                  Text(
                    widget.label,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.labelColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              CustomButton.outline(
                height: 48,
                width: 48,
                padding: EdgeInsets.zero,
                onTap: () {
                  widget.onInfoTap();
                },
                child: AppIcons.infoCircle.toSVGWidget(
                  color: AppColors.primaryColor,
                ),
              ),
              Gap(8),
              CustomButton(
                height: 48,
                width: 48,
                padding: EdgeInsets.zero,
                onTap: () {
                  setState(() {
                    added = !added;
                  });
                },
                child: added ? AppIcons.minus.toSVGWidget() : AppIcons.plus.toSVGWidget(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
