import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(title, style: AppTextStyles.heading, textAlign: TextAlign.center,),
          SizedBox(
            height: 20,
          ),
          AnswerWidget(title: "Kit de desenvolvimento de interface de usuário"),
          AnswerWidget(title: "Kit de desenvolvimento de interface de usuário"),
          AnswerWidget(title: "Kit de desenvolvimento de interface de usuário"),
          AnswerWidget(title: "Kit de desenvolvimento de interface de usuário"),
        ],
      ),
    );
  }
}