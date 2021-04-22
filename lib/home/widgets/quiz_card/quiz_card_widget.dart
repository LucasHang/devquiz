import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.border,
            blurRadius: 6,
            offset: Offset.fromDirection(1.6, 2.0),
            spreadRadius: -2
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 16,),
          Text(
            "Gerenciamento de estado", 
            style: AppTextStyles.heading15
          ),
          SizedBox(height: 9,),
          Text(
            "3 de 10", 
            style: AppTextStyles.body11
          ),
          SizedBox(height: 2,),
          LinearProgressIndicator(
            value: 0.3,
            backgroundColor: AppColors.chartSecondary,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
          ),
        ],
      ),
    );
  }
}