import 'dart:async';

import 'package:evo_med/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/service_locator.dart';
import 'package:evo_med/core/services/shared_preference_manager.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:evo_med/features/saved/presentation/blocs/saved/saved_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 28,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(Assets.imagesEvoMedLogo),
            ),
          ],
        ),
      ),
    );
  }

  void init() {
    Timer(
      Duration(seconds: 1),
      () {
        if (SharedPreferenceManager.getBool(AppConstants.isFirstTimeSplash, defValue: true)) {
          SharedPreferenceManager.putBool(key: AppConstants.isFirstTimeSplash, value: false);
          context.goNamed(AppRouter.startSelectLanguage);
        } else {
          /// Check if the user is logged in
          if (SharedPreferenceManager.getString(AppConstants.token, defValue: '').isNotEmpty) {
            context.read<ProfileBloc>().add(ProfileGetEvent());
            context.read<SavedBloc>().add(GetSavedEvent());
            if (SharedPreferenceManager.getString(AppConstants.pinCode, defValue: "").isNotEmpty) {
              context.goNamed(AppRouter.loginWithPinCode);
            } else {
              context.goNamed(AppRouter.home);
            }
          } else {
            context.goNamed(AppRouter.home);
          }
        }
      },
    );
  }
}
