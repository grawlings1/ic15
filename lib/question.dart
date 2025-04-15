import 'package:html_unescape/html_unescape.dart';

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var unescape = HtmlUnescape();

    String decodedQuestion = unescape.convert(json['question']);

    String decodedCorrectAnswer = unescape.convert(json['correct_answer']);

    List<String> decodedIncorrectAnswers = List<String>.from(
      json['incorrect_answers'].map((answer) => unescape.convert(answer)),
    );

    List<String> options = [...decodedIncorrectAnswers, decodedCorrectAnswer];
    options.shuffle();

    return Question(
      question: decodedQuestion,
      options: options,
      correctAnswer: decodedCorrectAnswer,
    );
  }
}
