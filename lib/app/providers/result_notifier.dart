import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/app/models/answer_model.dart';
import 'package:loshical/shared/helper/model/result_data.dart';

class ResultNotifier extends StateNotifier<ResultData?> {
  ResultNotifier() : super(null);
  ResultData? get data => state;
  //i coult not understand why you wanted to keep this answer is true or false data here on 6. part of the task
  bool? get isAnswerTrue => state?.answerIsTrue;
  //
  void setAnswer(AnswerModel answer) {
    state = state == null
        ? ResultData(lastSelectedAnswer: answer)
        : state?.copyWith(lastSelectedAnswer: answer);
    debugPrint(state.toString());
  }
}
