import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/app/services/game_service.dart';
import 'package:loshical/app/notifiers/result_provider.dart';
import 'package:loshical/ui/widgets/answer_image.dart';
import 'package:loshical/app/models/answer_model.dart';
import 'package:loshical/ui/screens/how_to_play_screen.dart';
import 'package:loshical/ui/widgets/question_image.dart';

import 'result_screen.dart';

class QuestionScreen extends ConsumerWidget {
  QuestionScreen({super.key});
  static const route = '/';
  final _gameService = GameSevrice();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = _gameService.questions;
    final answers = _gameService.answers;
    final resultProvider_ = ref.watch(resultProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loshical'),
        actions: [
          IconButton(
            onPressed: () => context.goNamed(HowToPlayScreen.route),
            icon: const Icon(Icons.info_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const Text('Choose the image that completes the pattern: '),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                children: questions.map(
                  (question) {
                    final child = question.isDragTarget
                        ? Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: !question.isDragTarget
                                    ? Colors.transparent
                                    : resultProvider_ == null
                                        ? Colors.transparent
                                        : resultProvider_.answerIsTrue != null &&
                                                resultProvider_.answerIsTrue!
                                            ? Colors.green
                                            : Colors.red,
                              ),
                            ),
                            child: resultProvider_?.lastSelectedAnswer != null
                                ? AnswerImage(
                                    assetPath: resultProvider_!.lastSelectedAnswer!.path,
                                  )
                                : QuestionImage(assetPath: question.path),
                          )
                        : QuestionImage(assetPath: question.path);
                    return question.isDragTarget
                        ? DragTarget<AnswerModel>(
                            builder:
                                (BuildContext context, List<AnswerModel?> accepted, List rejected) {
                              return child;
                            },
                            onAccept: (data) {
                              ref.read(resultProvider.notifier).setAnswer(data);
                              //i made unnatural delay to see color changing
                              Future.delayed(const Duration(seconds: 1)).then((_) {
                                context.goNamed(ResultScreen.route, extra: data.id);
                              });
                            },
                          )
                        : child;
                  },
                ).toList(),
              ),
              const Spacer(),
              const Text('Which of the shapes below continues the sequence'),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                children: answers.map((answer) {
                  final child = AnswerImage(
                    assetPath: answer.path,
                  );
                  return Draggable<AnswerModel>(
                    feedback: child,
                    data: answer,
                    child: child,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 42,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
