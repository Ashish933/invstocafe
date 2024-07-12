import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utility/color_theems.dart';

class Horizontal {
  static Divider customDivider({
    int thickness = 1,
    int height = 2,
    Color? color,
  }) {
    return Divider(
      thickness: thickness.toDouble(),
      height: height.toDouble(),
      color: color ?? AppColors.primaryColor.withOpacity(0.2),
    );
  }
}
