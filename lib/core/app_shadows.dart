import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  static final BoxShadow card = BoxShadow(
    color: AppColors.border,
    blurRadius: 6,
    offset: Offset.fromDirection(1.6, 2.0),
    spreadRadius: -2
  );
}