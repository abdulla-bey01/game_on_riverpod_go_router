import 'package:loshical/assets.dart';

class QuestionModel {
  final int id;
  bool get isDragTarget => id == 2;
  String get path => AssetManager.path(id: id, assetType: AssetType.question);

  QuestionModel({required this.id});
}
