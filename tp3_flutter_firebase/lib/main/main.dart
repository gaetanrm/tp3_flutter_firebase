import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_cubit/business_logic/cubit/answer_cubit.dart';
import '../bloc_cubit/presentation/quiz_page.dart';
import 'exercise_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2 - Interfaces graphiques',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ExerciseSelectorPage(),
        '/quiz': (context) => BlocProvider(
            create: (context) => AnswerCubit(), child: const QuizPage()),
      },
    );
  }
}
