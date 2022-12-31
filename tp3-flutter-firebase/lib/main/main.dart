import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tp3_flutter_firebase/bloc_cubit/data/data_providers/questions_api.dart';
import 'package:tp3_flutter_firebase/bloc_cubit/presentation/pages/question_creation_page.dart';
import '../firebase_options.dart';

import '../bloc_cubit/business_logic/cubit/answer_cubit.dart';
import '../bloc_cubit/presentation/pages/quiz_page.dart';
import 'exercise_selector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        '/questionCreation': (context) => QuestionCreationPage(),
      },
    );
  }
}
