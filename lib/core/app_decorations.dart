import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_shadows.dart';

class AppDecorations {
  static final BoxDecoration card = BoxDecoration(
    border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
    borderRadius: BorderRadius.circular(10),
    color: AppColors.white,
    boxShadow: [
      AppShadows.card
    ],
  );
}