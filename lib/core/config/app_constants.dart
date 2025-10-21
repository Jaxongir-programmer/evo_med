import 'dart:ui';

import 'package:yandex_mapkit/yandex_mapkit.dart';

class AppConstants {
  //? App Global Constants
  static const String baseUrl = 'https://test.api.evo_med.uz/api';

  //? Shared Preference Keys
  static const String pinCode = 'pinCode';
  static const String isBiometricEnabled = 'isBiometricEnabled';
  static const String language = 'language';
  static const String token = 'token';
  static const String refreshToken = 'refreshToken';
  static const String isFirstTimeSplash = 'isFirstTimeSplash';
  static const String isFirstBonusDialog = 'isFirstBonusDialog';
  static const String aliceState = 'aliceState';
}

const List<Locale> supportedLocales = [
  Locale.fromSubtags(languageCode: 'uz', scriptCode: 'Latn', countryCode: "O‘z"),
  Locale.fromSubtags(languageCode: 'uz', scriptCode: 'Cyrl', countryCode: "Ўз"),
  Locale('ru', "Ру"),
];

CameraBounds cameraBound = const CameraBounds(
  minZoom: 2,
  maxZoom: 22,
  latLngBounds: BoundingBox(
    northEast: Point(latitude: 45.5909, longitude: 73.1472),
    southWest: Point(latitude: 37.1851, longitude: 55.9755),
  ),
);
