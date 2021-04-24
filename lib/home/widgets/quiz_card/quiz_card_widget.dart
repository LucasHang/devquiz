import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_decorations.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int questionsLength;
  final int questionsAnsweredLength;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key, 
    required this.title,
    required this.questionsLength,
    this.questionsAnsweredLength = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
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
                "$questionsAnsweredLength de $questionsLength", 
                style: AppTextStyles.body11
              ),
              SizedBox(height: 2,),
              Container(
                height: 5,
                child: ProgressIndicatorWidget(
                  value: (questionsAnsweredLength/questionsLength),
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
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.white),
        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColors.border),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}