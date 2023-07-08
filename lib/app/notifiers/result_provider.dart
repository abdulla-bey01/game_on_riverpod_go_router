import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/app/providers/result_notifier.dart';
import 'package:loshical/shared/helper/model/result_data.dart';

final resultProvider = StateNotifierProvider<ResultNotifier, ResultData?>((ref) {
  return ResultNotifier();
});
