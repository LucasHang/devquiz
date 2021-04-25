import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool isConfirmed;
  final ValueChanged<bool> onTap;

  const AnswerWidget({
    Key? key, 
    required this.answer,
    required this.onTap,
    this.isSelected = false,
    this.isConfirmed = false,
  }) : super(key: key);

  Color get _selectedColorRight {
      if( !isConfirmed ) return AppColors.purple;
      return answer.isRight ? AppColors.darkGreen : AppColors.darkRed;
  }

  Color get _selectedBorderRight {
    if( !isConfirmed ) return AppColors.purple;
    return answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  }

  Color get _selectedColorCardRight {
    if( !isConfirmed ) return AppColors.lightPurple;
    return answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  }

  Color get _selectedBorderCardRight {
    if( !isConfirmed ) return AppColors.purple;
    return answer.isRight ? AppColors.green : AppColors.red;
  }

  TextStyle get _selectedTextStyleRight {
    if( !isConfirmed ) return AppTextStyles.body;
    return answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  }

  IconData get _selectedIconRight {
    if( !isConfirmed ) return Icons.help;
    return answer.isRight ? Icons.check : Icons.close;
  } 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
          onPressed: () => onTap(answer.isRight),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(16)),
            backgroundColor: MaterialStateProperty.all(isSelected ? _selectedColorCardRight : AppColors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                  color: isSelected ? _selectedBorderCardRight : AppColors.border
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            shadowColor: MaterialStateProperty.all(AppColors.border),
            overlayColor: MaterialStateProperty.all(AppColors.overlay),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  answer.title, 
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