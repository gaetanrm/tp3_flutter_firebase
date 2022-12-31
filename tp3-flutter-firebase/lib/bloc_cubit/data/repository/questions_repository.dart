import 'dart:collection';

import 'package:tp3_flutter_firebase/bloc_cubit/data/data_providers/questions_api.dart';

import '../model/question.dart';

class QuestionsRepository {
  QuestionsAPI questionsAPI = QuestionsAPI();

  final List<Question> _questions = [];

  UnmodifiableListView<Question> get questions => UnmodifiableListView(_questions);

  QuestionsRepository(){
    populateQuestionsCollection();
  }
/*
  void fillQuestionList() {
    questionsAPI.getRawQuestions().then((collection) {
      for(var doc in collection.docs) {
        _questions.add(Question.fromMap(doc.data()));
      }
    }
    );
  }*/

  void populateQuestionsCollection() {
    List<Question> starterQuestions = [
      Question(
          urlImage: 'assets/images/doudou.jpg',
          questionText: "Ceci est un chien",
          isCorrect: false,
          answerText: "Faux. Ceci n'est pas un chien",
          thematic: 'Animaux'),
      Question(
          urlImage: 'assets/images/algebra.jpg',
          questionText: "2+2 font 5",
          isCorrect: true,
          answerText:
          "Vrai. En prenant en compte la marge d'erreur, 2+2 font 5.",
          thematic: 'Mathématiques'),
      Question(
          urlImage: 'assets/images/eiffel.jpeg',
          questionText: "Paris se situe en France",
          isCorrect: false,
          answerText: "Faux. Paris Hilton réside en amérique.",
          thematic: 'Géographie')
    ];

    for (Question question in starterQuestions) {
      questionsAPI.addQuestion(question);
      questionsAPI.addThematic(question.thematic);
    }
  }

  void addQuestionsFromDocToRepository(Question question) {
    _questions.add(question);
  }
}

