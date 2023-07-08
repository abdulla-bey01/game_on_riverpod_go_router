import 'package:loshical/app/models/answer_model.dart';

class ResultData {
  AnswerModel? lastSelectedAnswer;
  //so bad approach
  bool? get answerIsTrue => lastSelectedAnswer == null ? null : lastSelectedAnswer?.id == 5;
  ResultData({this.lastSelectedAnswer});
  ResultData copyWith({AnswerModel? lastSelectedAnswer}) {
    return ResultData(lastSelectedAnswer: lastSelectedAnswer ?? this.lastSelectedAnswer);
  }

  @override
  String toString() {
    return lastSelectedAnswer == null ? 'i am null' : '${lastSelectedAnswer?.path}';
  }
}
