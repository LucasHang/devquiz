import 'package:devquiz/core/app_decorations.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int questionsQuantity;
  final int questionAnsweredQuantity;

  const QuizCardWidget({
    Key? key, 
    required this.title,
    required this.questionsQuantity,
    this.questionAnsweredQuantity = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: AppDecorations.card,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 16,),
          Text(
            title, 
            style: AppTextStyles.heading15
          ),
          SizedBox(height: 9,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$questionAnsweredQuantity de $questionsQuantity", 
                style: AppTextStyles.body11
              ),
              SizedBox(height: 2,),
              Container(
                height: 5,
                child: ProgressIndicatorWidget(
                  value: (questionAnsweredQuantity/questionsQuantity),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.5),
                ),
                clipBehavior: Clip.hardEdge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}