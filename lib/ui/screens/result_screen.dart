import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/ui/widgets/answer_image.dart';
import 'package:loshical/app/services/answer_service.dart';
import 'package:loshical/app/notifiers/result_provider.dart';

class ResultScreen extends ConsumerWidget {
  ResultScreen({super.key, required this.answerId});
  static const route = 'result-screen';
  final int answerId;
  final AnswerService _answerService = AnswerService();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final answer = _answerService.getAnswerById(answerId);
    final answerIstrue = ref.read(resultProvider)?.answerIsTrue;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            ref.invalidate(resultProvider);
            context.pop();
          },
        ),
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnswerImage(assetPath: answer.path),
            const SizedBox(height: 30),
            Text(answerIstrue! ? 'Right answer, congr' : 'Sorry, wrong answer'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(resultProvider);
                context.pop();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
