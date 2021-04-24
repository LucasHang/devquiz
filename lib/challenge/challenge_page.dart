import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  ChallengePage({Key? key, required this.questions}) : super(key: key);

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
        children: widget.questions.map((e) {
          return ValueListenableBuilder<bool>(
            valueListenable: controller.isConfirmedNotifier, 
            builder: (context, value, _) => QuizWidget(question: e, isConfirmed: value,)
          );
        }).toList(),
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
                            if( value == widget.questions.length ) return Navigator.pop(context);

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