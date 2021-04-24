import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestion;
  final int questionsLength;

  QuestionIndicatorWidget({
    Key? key,
    required this.currentQuestion,
    required this.questionsLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Questão $currentQuestion", style: AppTextStyles.body,),
              Text(" de $questionsLength", style: AppTextStyles.body,),
            ],
          ), 
          SizedBox(height: 10,),
          ProgressIndicatorWidget(
            value: currentQuestion/questionsLength,
          ),
        ],
      ),
    );
  }
}