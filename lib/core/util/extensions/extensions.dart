import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  Size get sizeOf => MediaQuery.sizeOf(this);

  Brightness get brightness => theme.brightness;

  AppBarTheme get appBarTheme => theme.appBarTheme;

  void popUntil(String targetRoute) {
    final router = GoRouter.of(this);
    router.popUntilPath(targetRoute);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, maxLines: 2),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

extension CrossFade on CrossFadeState {
  bool get isShowFirst => this == CrossFadeState.showFirst;

  bool get isShowSecond => this == CrossFadeState.showSecond;
}

extension IntExtension on int {
  String priceFormat() {
    if (this == 0) {
      return '0';
    } else {
      return NumberFormat('#,###.00', 'en_US').format(this).replaceAll(".00", "").replaceAll(",", " ");
    }
  }
}

extension StringExtension on String {
  Widget toSVGWidget({
    Color? color,
    double? size,
    Function()? onTap,
    BoxFit fit = BoxFit.scaleDown,
  }) =>
      GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          height: size,
          width: size,
          child: Center(
            child: SvgPicture.asset(
              this,
              color: color,
              fit: fit,
              height: size,
              width: size,
            ),
          ),
        ),
      );

  int toInt() => int.tryParse(this) ?? 0;

  Text toStyle({
    required TextStyle style,
    required TextStyle defStyle,
    TextAlign? textAlign,
    int? maxLines,
    required List<String> args,
  }) {
    List<TextSpan> children = [];
    List<String> splitText = split('{}'); // Splitting the string at the placeholders.

    for (int i = 0; i < splitText.length; i++) {
      // Add plain text before placeholder
      children.add(TextSpan(text: splitText[i], style: style));

      // Add the corresponding argument text if available
      if (i < args.length) {
        children.add(TextSpan(text: args[i], style: defStyle));
      }
    }

    return Text.rich(
      TextSpan(children: children),
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

extension GoRouterExtension on GoRouter {
  void popUntilPath(String ancestorPath) {
    while (routerDelegate.currentConfiguration.matches.last.matchedLocation != ancestorPath) {
      if (!canPop()) {
        return;
      }
      pop();
    }
  }
}
