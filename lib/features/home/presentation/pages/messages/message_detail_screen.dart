import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';

class MessageDetailScreen extends StatefulWidget {
  const MessageDetailScreen({super.key});

  @override
  State<MessageDetailScreen> createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
            context.pop();
          }),
          toolbarHeight: 64,
          surfaceTintColor: AppColors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 0),
          child: Column(
            children: [
              Text(
                "Aprel oyida Toshkent shaxridagi ko’chmas mulk narxlaridan yangiliklar",
                style: context.textTheme.displayLarge,
              ),
              Gap(18),
              Text(
                "At Figma, we believe AI should be more than a novelty—it should offer solutions to actual problems. With this in mind, we’ve integrated AI into FigJam to make it as useful as possible. Our mission? To help you instantly visualize ideas and plans, suggest best practices, and, of course, automate tedious tasks, so you can focus on the bigger picture.",
                style: context.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
