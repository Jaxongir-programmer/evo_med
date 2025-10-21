import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/scale_animation_widget.dart';

class HomeAdsWidget extends StatelessWidget {
  const HomeAdsWidget({
    super.key,
    required this.title,
    required this.label,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String label;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScaleAnimationWidget(
        onTap: onTap,
        child: Container(
          height: 116,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                AppColors.containerBloc,
                BlendMode.multiply,
              ),
              alignment: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(
                title,
                style: context.textTheme.displaySmall!.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                label,
                style: context.textTheme.labelMedium!.copyWith(
                  color: AppColors.defaultDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
