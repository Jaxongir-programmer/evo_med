import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_constants.dart';
import 'package:evo_med/core/services/shared_preference_manager.dart';

class NamesEntity extends Equatable {
  final String uz;
  final String ru;
  final String uzc;

  const NamesEntity({
    this.uz = "",
    this.ru = "",
    this.uzc = "",
  });

  String get titleByLocale {
    final locale = SharedPreferenceManager.getString(AppConstants.language, defValue: 'uz');
    switch (locale) {
      case "uz":
        return uz;
      case "ru":
        return ru;
      case "uzc":
        return uzc;
      default:
        return uz;
    }
  }

  @override
  List<Object?> get props => [
    uz,
    ru,
    uzc,
  ];
}
