import 'package:loshical/app/models/answer_model.dart';
import 'package:loshical/app/models/question_model.dart';
import 'package:loshical/app/services/question_service.dart';
import 'answer_service.dart';

class GameSevrice {
  List<QuestionModel> get questions => QuestionService().questions;
  List<AnswerModel> get answers => AnswerService().answers;
}
