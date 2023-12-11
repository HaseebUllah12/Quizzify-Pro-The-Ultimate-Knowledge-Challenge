import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quiz_brain=QuizBrain();

void main() {
  runApp(Quizzler());
}
class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            )
        )
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
   QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget>scorekeeper=[];
  void showResultAlert(BuildContext context) {
    Alert(
      context: context,
      title: 'Quiz Finished',
      desc: 'You have reached the end of the quiz.',
      buttons: [
        DialogButton(
          child: Text(
            'RESTART',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            // Add code to reset the quiz here
          },
          width: 120,
          color: Colors.lightBlue,
        ),
      ],
    ).show();
  }
  void CheckAnswer(bool userPickedAnswer) {
    bool CorrectAnswer = quiz_brain.getCorrectAnswer();
    setState(() {
      if (quiz_brain.isFinished()) {
        showResultAlert(context); // Show the alert when the quiz is finished
      } else {
        if (userPickedAnswer == CorrectAnswer) {
          scorekeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          scorekeeper.add(Icon(Icons.close, color: Colors.red));
        }
        quiz_brain.nextQuestion();
      }
    });
  }


  /*List<String> questions=[
   'You can lead a cow down stairs but not up stairs.',
   'Approx one quarter of human bones are in the feet.',
   'A slug\'s blood id green.'
 ];
 List<bool> answers=[
   false,
   true,
   true
  ];*/



  @override
  Widget build(BuildContext context) {

    String currentQuestion =
    quiz_brain.getQuestionText().isNotEmpty ? quiz_brain.getQuestionText(): '';

    return   Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentQuestion,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green, // Set the text color
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
              CheckAnswer(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
               backgroundColor: Colors.red, // Set the text color
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                CheckAnswer(false);
                //The user picked false.

              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
         ElevatedButton(
          child: Text('Show Alert'),
           onPressed: () {
               showResultAlert(context);
    },
         ),
      ],
    );
  }
}
