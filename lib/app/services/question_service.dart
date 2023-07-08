import 'package:loshical/app/models/question_model.dart';

class QuestionService {
  final List<QuestionModel> _questions = [
    QuestionModel(id: 1),
    QuestionModel(id: 2),
    QuestionModel(id: 3),
    QuestionModel(id: 4),
    QuestionModel(id: 5),
  ];
  List<QuestionModel> get questions => _questions;
}
