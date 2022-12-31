import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp3_flutter_firebase/bloc_cubit/presentation/question_box.dart';
import 'package:tp3_flutter_firebase/bloc_cubit/presentation/results_box.dart';

import '../business_logic/cubit/answer_cubit.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('TP2 - Quizz')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: BlocBuilder<AnswerCubit, AnswerState>(
                builder: (context, state) {
                  return _getNextWidget(state);
                },
              ),
            )
          ],
        ));
  }

  Widget _getNextWidget(AnswerState answerState) {
    bool quizOver = answerState.quizOver;

    if (!quizOver) {
      return const QuestionBox();
    } else {
      return const ResultsBox();
    }
  }
}