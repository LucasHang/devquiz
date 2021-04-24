import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final bool isConfirmed;

  QuizWidget({
    Key? key, 
    required this.question, 
    required this.isConfirmed,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedAnswer = -1;

  AnswerModel getAnswer(int index) => widget.question.answers[index];

  select(int index) {
    selectedAnswer = index;
    setState(() {});
  }
  bool isSelected(int index) => index == selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            widget.question.title, 
            style: AppTextStyles.heading, 
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          for( var i = 0; i < widget.question.answers.length; i++ ) 
            AnswerWidget(
              answer: getAnswer(i),
              onTap: () => select(i),
              isSelected: isSelected(i),
              isConfirmed: widget.isConfirmed,
            )
        ],
      ),
    );
  }
}