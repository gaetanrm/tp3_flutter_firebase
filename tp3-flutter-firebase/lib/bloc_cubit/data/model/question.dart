class Question {
  String urlImage;
  String questionText;
  bool isCorrect;
  String answerText;
  String thematic;

  Question(
      {required this.urlImage,
        required this.questionText,
        required this.isCorrect,
        required this.answerText,
        required this.thematic}
      );

  static Question fromMap(Map<String, dynamic> map) {
    return Question(
      questionText: map['questionText'],
      urlImage: map['urlImage'],
      isCorrect: map['isCorrect'],
      answerText: map['answerText'],
      thematic: map['thematic']
    );
  }

  static Map<String, dynamic> toMap(Question question) {
    return {
      'questionText': question.questionText,
      'urlImage': question.urlImage,
      'isCorrect': question.isCorrect,
      'answerText': question.answerText,
      'thematic': question.thematic
    };
  }
}