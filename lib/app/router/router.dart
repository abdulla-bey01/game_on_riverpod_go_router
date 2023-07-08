import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loshical/ui/screens/how_to_play_screen.dart';
import 'package:loshical/ui/screens/question_screen.dart';
import 'package:loshical/ui/screens/result_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: QuestionScreen.route,
      builder: (BuildContext context, GoRouterState state) {
        return QuestionScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: HowToPlayScreen.route,
          name: HowToPlayScreen.route,
          builder: (BuildContext context, GoRouterState state) {
            return const HowToPlayScreen();
          },
        ),
        GoRoute(
          path: ResultScreen.route,
          name: ResultScreen.route,
          builder: (BuildContext context, GoRouterState state) {
            return ResultScreen(answerId: state.extra as int);
          },
        ),
      ],
    ),
  ],
);
