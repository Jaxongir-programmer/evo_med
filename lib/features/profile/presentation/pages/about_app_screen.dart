import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          context.pop();
        }),
        title: Text(
          LocaleKeys.title_aboutApp.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          "At Figma, we believe AI should be more than a novelty—it should offer solutions to actual problems. With this in mind, we’ve integrated AI into FigJam to make it as useful as possible. Our mission? To help you instantly visualize ideas and plans, suggest best practices, and, of course, automate tedious tasks, so you can focus on the bigger picture.",
          style: context.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
