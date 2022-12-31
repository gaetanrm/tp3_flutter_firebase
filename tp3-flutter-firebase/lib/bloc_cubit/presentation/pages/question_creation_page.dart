import 'package:flutter/material.dart';
import 'package:tp3_flutter_firebase/bloc_cubit/data/data_providers/questions_api.dart';
import 'package:tp3_flutter_firebase/bloc_cubit/data/model/question.dart';
import 'package:tp3_flutter_firebase/bloc_cubit/data/repository/questions_repository.dart';

class QuestionCreationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  QuestionCreationPage({Key? key}) : super(key: key);

  String questionText = "";
  String urlImage = "";
  bool isCorrect = false;
  String answerText = "";
  String thematic = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TP3 - Question Creation')),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textField(const Icon(Icons.question_mark), "Question text", setQuestionText),
                      textField(const Icon(Icons.attach_file), "Url image", setUrlImage),
                      textField(const Icon(Icons.done), "Correct answer (0 ou 1)", setCorrect),
                      textField(const Icon(Icons.text_fields), "Answer text", setAnswerText),
                      textField(const Icon(Icons.topic), "Thematic", setThematic),
                      submitButton(context),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  ElevatedButton submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Adding to Database ...')),
          );
          _formKey.currentState?.save();
          Question question = Question(urlImage: urlImage, questionText: questionText, isCorrect: isCorrect, answerText: answerText, thematic: thematic);
          QuestionsAPI().addThematic(question.thematic);
          QuestionsAPI().addQuestion(question);
          Navigator.pop(context);
        }
      },
      child: const Text('Submit'),
    );
  }

  Padding textField(Icon icon, String labelText, Function onSavedFunction) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
          decoration: InputDecoration(prefixIcon: icon, labelText: labelText, border: const OutlineInputBorder()),
          style: const TextStyle(fontSize: 15),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onSaved: (value) {
            onSavedFunction(value);
          }),
    );
  }

  void setQuestionText(String text) {
    questionText = text;
  }

  void setUrlImage(String url) {
    urlImage = url;
  }

  void setCorrect(String isCorrect) {
    this.isCorrect = isCorrect == "1" ? true : false;
  }

  void setAnswerText(String text) {
    answerText = text;
  }

  void setThematic(String thematic) {
    this.thematic = thematic;
  }
}
