import 'question.dart';
class QuizBrain{
  int _questionNumber=0;
  List<Question> _questionBank=[

    Question(q:'Approx one quarter of human bones are in the feet.', a:  true),
    Question(q:'A slug\'s blood id green.', a:  true),
    Question(q:'You can lead a cow down stairs but not up stairs.' , a: false),
    Question(q:'Approx one quarter of human bones are in the feet.', a:  true),
    Question(q:'A slug\'s blood id green.', a:  true)
  ];
String getQuestionText(){
  return _questionBank[_questionNumber].questionText;
}
bool getCorrectAnswer(){
  return _questionBank[_questionNumber].questionAnswer;
}
  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }
  void nextQuestion() {
    if (!isFinished()) {
      _questionNumber++;
    }
  }
}


