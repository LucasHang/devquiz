import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;

  NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.darkGreen({required String label, required VoidCallback onTap})
    : this.label = label,
      this.backgroundColor = AppColors.darkGreen,
      this.fontColor = AppColors.white,
      this.borderColor = AppColors.green,
      this.overlayColor = AppColors.darkerGreen,
      this.onTap = onTap;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
    : this.label = label,
      this.backgroundColor = AppColors.white,
      this.fontColor = AppColors.grey,
      this.borderColor = AppColors.border,
      this.overlayColor = AppColors.lighterGrey,
      this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(overlayColor),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: borderColor,
              )
            )
          ),
        ),
        onPressed: () {},
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}