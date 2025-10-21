import 'package:flutter/material.dart';

class AppDecoration {
  const AppDecoration._();

  static List<BoxShadow> shadowLow8 = [
    BoxShadow(
      color: Color(0x14141414),
      offset: const Offset(0, 1),
      blurRadius: 8,
    ),
    BoxShadow(
      color: Color(0x1F141414),
      offset: const Offset(0, 0),
      blurRadius: 1,
    ),
  ];

  static List<BoxShadow> innerShadow = [
    BoxShadow(
      color: Color(0x2A550F05),
      offset: const Offset(0, 6),
      blurRadius: 19,
    ),
    BoxShadow(
      color: Color(0x278F1A07),
      offset: const Offset(0, 10),
      blurRadius: 20,
    ),
  ];
}
