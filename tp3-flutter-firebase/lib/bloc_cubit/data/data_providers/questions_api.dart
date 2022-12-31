import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/question.dart';

class QuestionsAPI {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getRawQuestions() async {
    return await firebaseFirestore.collection("questions").get();
  }

  void addQuestion(Question question) {
    final collection = firebaseFirestore.collection("questions");
    collection.doc(question.answerText).set(Question.toMap(question));
  }

  void addThematic(String thematic) {
    final collection = firebaseFirestore.collection("thematics");
    collection.doc(thematic).set({'name' : thematic});
  }
}