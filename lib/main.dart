import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/service_locator.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/config/app_theme.dart';
import 'package:evo_med/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:evo_med/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:evo_med/features/saved/presentation/blocs/saved/saved_bloc.dart';
import 'package:nirikshak/nirikshak.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      HttpOverrides.global = MyHttpOverrides();

      await setupServiceLocator();
      runApp(
        EasyLocalization(
          path: 'assets/translations',
          supportedLocales: supportedLocales
              .map((e) => Locale.fromSubtags(languageCode: e.languageCode, scriptCode: e.scriptCode))
              .toList(),
          fallbackLocale: const Locale.fromSubtags(
            languageCode: 'uz',
            scriptCode: 'Latn',
          ),
          startLocale: const Locale.fromSubtags(languageCode: 'uz', scriptCode: 'Latn'),
          child: MyApp(),
        ),
      );
    },
    (error, stack) {
      log("Error by runZoneGuarded: ", error: error, stackTrace: stack, level: 10, zone: Zone.current);
    },
  );
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final alice = Nirikshak();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey _navigatorKey = GlobalKey<NavigatorState>();

  Offset _offset = Offset.zero;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
                getVerificationCodeUseCase: serviceLocator(),
                checkVerificationCodeUseCase: serviceLocator(),
                registerUseCase: serviceLocator(),
                resetPasswordUseCase: serviceLocator(),
                loginUseCase: serviceLocator(),
                createDeviceUseCase: serviceLocator(),
                forgetPasswordUseCase: serviceLocator()),
          ),
          BlocProvider.value(
            value: serviceLocator<ProfileBloc>(),
          ),
          BlocProvider(
            create: (context) => SavedBloc(
              addToSavedUseCase: serviceLocator(),
              deleteSavedUseCase: serviceLocator(),
              updateSavedUseCase: serviceLocator(),
              savedUseCase: serviceLocator(),
            ),
          ),
        ],
        child: MaterialApp.router(
          key: _navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'evo_med',
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          theme: AppTheme.theme,
          routerConfig: AppRouter.router,
          builder: (context, child) {
            if (_offset.dx == 0) {
              _offset = Offset(MediaQuery.of(context).size.width * .8, MediaQuery.of(context).size.width * .85);
            }
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: Stack(
                  children: [
                    child!,
                    if (true)
                      Positioned(
                        left: _offset.dx,
                        top: _offset.dy,
                        child: GestureDetector(
                          onPanUpdate: (d) => setState(() => _offset += Offset(d.delta.dx, d.delta.dy)),
                          child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(56),
                            ),
                            onPressed: () {
                              MyApp.alice.showNirikshak(navigatorKey.currentContext!);
                            },
                            backgroundColor: Colors.white.withOpacity(.5),
                            child: const Icon(Icons.http, color: Colors.green, size: 32),
                          ),
                        ),
                      ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
