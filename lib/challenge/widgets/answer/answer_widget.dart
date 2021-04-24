import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  // final bool isSelected;
  final ValueNotifier<bool> isSelected;
  final VoidCallback onTap;

  const AnswerWidget({
    Key? key, 
    required this.answer,
    required this.onTap,
    // this.isSelected = false,
    required this.isSelected,
  }) : super(key: key);

  Color get _selectedColorRight =>
      answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ValueListenableBuilder<bool>(
        valueListenable: isSelected,
        builder: (context, value, _) => ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(16)),
            backgroundColor: MaterialStateProperty.all(value ? _selectedColorCardRight : AppColors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                  color: value ? _selectedBorderCardRight : AppColors.border
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            shadowColor: MaterialStateProperty.all(AppColors.border),
            overlayColor: MaterialStateProperty.all(AppColors.moreLighterGrey),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  answer.title, 
                  style: value ? _selectedTextStyleRight : AppTextStyles.body,
                ),
              ),

              Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: value ? _selectedColorRight : AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.fromBorderSide(BorderSide(
                    color: value ? _selectedBorderRight : AppColors.border,
                  ))
                ),
                child: value 
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
      ),
    );
  }
}