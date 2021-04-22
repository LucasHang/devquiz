import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_shadows.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;
  const AnswerWidget({
    Key? key, 
    required this.title,
    this.isSelected = false,
    this.isRight = false,
  }) : super(key: key);

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? _selectedColorCardRight : AppColors.white,
          border: Border.fromBorderSide(BorderSide(
            color: isSelected ? _selectedBorderCardRight : AppColors.border
          )),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            AppShadows.card
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title, 
                style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
              ),
            ),

            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: isSelected ? _selectedColorRight : AppColors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.fromBorderSide(BorderSide(
                  color: isSelected ? _selectedBorderRight : AppColors.border,
                ))
              ),
              child: isSelected 
                ? Icon(
                    _selectedIconRight, 
                    size: 20,
                    color: Colors.white,
                  ) 
                : null,
            )
          ],
        ),
      ),
    );
  }
}