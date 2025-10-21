import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/config/app_images.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

class AboutServiceScreen extends StatelessWidget {
  const AboutServiceScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          context.pop();
        }),
        title: Text(
          title,
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          Text(title, style: context.textTheme.displayMedium),
          Gap(16),
          Text(
            'At Figma, we believe AI should be more than a novelty—it should offer solutions to actual problems. With this in mind, we’ve integrated AI into FigJam to make it as useful as possible. Our mission? To help you instantly visualize ideas and plans, suggest best practices, and, of course, automate tedious tasks, so you can focus on the bigger picture.',
            style: context.textTheme.bodyLarge,
          ),
          Gap(32),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              AppImages.prising,
            ),
          ),
          Gap(32),
          Text(
            'At Figma, we believe AI should be more than a novelty—it should offer solutions to actual problems. With this in mind, we’ve integrated AI into FigJam to make it as useful as possible. Our mission? To help you instantly visualize ideas and plans, suggest best practices, and, of course, automate tedious tasks, so you can focus on the bigger picture.',
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
