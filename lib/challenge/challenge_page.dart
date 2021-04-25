import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({
    Key? key, 
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentQuestionNotifier, 
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentQuestion: value,
                  questionsLength: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          for(var i = 0; i < widget.questions.length; i++)
            ValueListenableBuilder<bool>(
              valueListenable: controller.isConfirmedNotifier, 
              builder: (context, value, _) => QuizWidget(
                question: widget.questions[i], 
                isConfirmed: value,
                onSelected: (isRight) => controller.answersMap[i] = isRight,
              ),
            )
        ],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentQuestionNotifier, 
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if( value < widget.questions.length )
                    Expanded(
                      child: NextButtonWidget.white(
                        label: "Pular",
                        onTap: () {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 250), 
                            curve: Curves.linear,
                          );
                        }
                      )
                    ),

                  if( value < widget.questions.length )
                    SizedBox(width: 8,),

                  Expanded(
                    child: NextButtonWidget.darkGreen(
                      label: "Confirmar",
                      onTap: () {
                        controller.isConfirmed = true;
                        Future.delayed(Duration(seconds: 1))
                          .then((_) {
                            if( value == widget.questions.length ) 
                              return Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                    title: widget.title,
                                    questionsLength: widget.questions.length,
                                    rightAnswersLength: controller.rightAnswersLength,
                                  ),
                                ),
                              );

                            pageController.nextPage(
                              duration: Duration(milliseconds: 250), 
                              curve: Curves.linear,
                            ).then((_) => controller.isConfirmed = false);
                          });
                      }
                    ),
                  ),
                ],
              );
            } 
          ),
        ),
      ),
    );
  }
}