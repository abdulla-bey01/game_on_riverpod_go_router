import 'package:loshical/assets.dart';

class AnswerModel {
  final int id;
  String get path => AssetManager.path(id: id, assetType: AssetType.answer);
  AnswerModel({required this.id});
  AnswerModel.empty({this.id = -1});
}
