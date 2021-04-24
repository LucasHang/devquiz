import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;

  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            question.title, 
            style: AppTextStyles.heading, 
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          ...question.answers.map((e) => AnswerWidget(
            title: e.title,
            isRight: e.isRight,
          )).toList(),
        ],
      ),
    );
  }
}