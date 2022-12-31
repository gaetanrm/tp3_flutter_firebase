import 'dart:collection';

import '../model/question.dart';

class QuestionsRepository {
  static final List<Question> _questions = [
    Question(
        urlImage: 'assets/images/doudou.jpg',
        questionText: "Ceci est un chien",
        isCorrect: false,
        answerText: "Faux. Ceci n'est pas un chien"),
    Question(
        urlImage: 'assets/images/algebra.jpg',
        questionText: "2+2 font 5",
        isCorrect: true,
        answerText:
        "Vrai. En prenant en compte la marge d'erreur, 2+2 font 5."),
    Question(
        urlImage: 'assets/images/eiffel.jpeg',
        questionText: "Paris se situe en France",
        isCorrect: false,
        answerText: "Faux. Paris Hilton réside en amérique.")
  ];

  static UnmodifiableListView<Question> get questions => UnmodifiableListView(_questions);
}

