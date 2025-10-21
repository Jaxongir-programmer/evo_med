import 'package:flutter/material.dart';
import 'package:evo_med/core/config/app_colors.dart';

class CustomBottomSheet {

  static Future<T?> showBottomSheet<T>({
    required BuildContext context,
    required Widget content,
    bool isScrollControlled = true,
    bool useSafeArea = true,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: isScrollControlled,
      useSafeArea: useSafeArea,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return content;
      },
    );
  }
}