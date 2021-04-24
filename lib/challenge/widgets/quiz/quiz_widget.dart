import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_controller.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;

  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  final controller = QuizController();
  
  AnswerModel getAnswer(int index) => widget.question.answers[index];

  ValueNotifier<bool> getIsSelectedNotifier(int index) => controller.isSelectedNotifiers[index];

  @override
  void initState() {
    super.initState();
    controller.isSelectedNotifiers = widget.question.answers.map((e) => ValueNotifier<bool>(false)).toList();
  }

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
              onTap: () => controller.setSelected(getIsSelectedNotifier(i)),
              isSelected: getIsSelectedNotifier(i),
            )
        ],
      ),
    );
  }
}