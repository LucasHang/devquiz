import 'package:flutter/cupertino.dart';

class ChallengeController {
  final currentQuestionNotifier = ValueNotifier<int>(1);
  int get currentQuestion => currentQuestionNotifier.value;
  set currentQuestion(int value) => currentQuestionNotifier.value = value;

  final isConfirmedNotifier = ValueNotifier<bool>(false);
  set isConfirmed(bool value) => isConfirmedNotifier.value = value;

  void onPageChanged(int newPageIndex) => currentQuestion = newPageIndex + 1;

  Map<int, bool> answersMap = {};
  int get rightAnswersLength{
    int rightAnswersLength = 0;
    answersMap.forEach((questionIndex, isRight) {
      if(isRight) rightAnswersLength++;
    });
    return rightAnswersLength;
  }
}