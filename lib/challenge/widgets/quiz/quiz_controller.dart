import 'package:flutter/material.dart';

class QuizController {
  List<ValueNotifier<bool>> isSelectedNotifiers = [];

  setSelected(ValueNotifier<bool> valueNotifier) {
    isSelectedNotifiers.forEach((element) {
      if( element.value ) element.value = false;
      element.value = false;
    });
    if( !valueNotifier.value ) valueNotifier.value = true;
  }
}