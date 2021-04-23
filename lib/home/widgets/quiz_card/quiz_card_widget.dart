import 'package:devquiz/core/app_decorations.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: AppDecorations.card,
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
          ProgressIndicatorWidget(
            value: 0.3,
          ),
        ],
      ),
    );
  }
}