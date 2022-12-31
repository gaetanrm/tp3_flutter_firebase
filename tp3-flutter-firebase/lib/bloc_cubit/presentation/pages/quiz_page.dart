import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp3_flutter_firebase/bloc_cubit/data/repository/questions_repository.dart';
import 'package:tp3_flutter_firebase/bloc_cubit/presentation/widgets/question_box.dart';

import '../../business_logic/cubit/answer_cubit.dart';
import '../../data/model/question.dart';
import '../widgets/results_box.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('TP3 - Quizz')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FutureBuilder(
                future: BlocProvider.of<AnswerCubit>(context)
                    .questionsRepository
                    .questionsAPI
                    .getRawQuestions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      BlocProvider.of<AnswerCubit>(context)
                          .questionsRepository
                          .fillRepositoryWithCollection(snapshot.data);
                      return BlocBuilder<AnswerCubit, AnswerState>(
                        builder: (context, state) {
                          return _getNextWidget(state);
                        },
                      );
                    }
                    if (snapshot.hasError) {
                      return const Text("Erreur");
                    } else {
                      return const Text("Pas de data");
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Column(
                      children: const [
                        Text("Chargement des questions"),
                        CircularProgressIndicator(),
                      ],
                    );
                  } else {
                    return Text("${snapshot.connectionState}");
                  }
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
