import 'package:loshical/app/models/answer_model.dart';

class AnswerService {
  final List<AnswerModel> _answers = [
    AnswerModel(id: 1),
    AnswerModel(id: 2),
    AnswerModel(id: 3),
    AnswerModel(id: 4),
    AnswerModel(id: 5),
  ];
  List<AnswerModel> get answers => _answers;

  AnswerModel getAnswerById(int id) => answers.firstWhere((element) => element.id == id);
}
