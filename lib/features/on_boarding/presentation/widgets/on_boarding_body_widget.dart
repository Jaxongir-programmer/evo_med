import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_imageview.dart';

class OnBoardingBodyWidget extends StatelessWidget {
  const OnBoardingBodyWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(context.padding.top + 60),
          CustomImageView(
            imageUrl: image,
            width: 296,
            height: 296,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(148)
          ),
          Gap(56),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 16,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.displayMedium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: AppColors.onBoardDesc,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
