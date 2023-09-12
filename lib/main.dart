import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<Map<String, dynamic>> _quizData = [
    {
      'question': 'What is the capital of France?',
      'options': ['London', 'Berlin', 'Paris', 'Madrid'],
      'correctIndex': 2,
    },
    {
      'question': 'Which programming language is Flutter built with?',
      'options': ['Dart', 'Java', 'Python', 'C++'],
      'correctIndex': 0,
    },
    {
      'question': 'What is 2 + 2?',
      'options': ['3', '4', '5', '6'],
      'correctIndex': 1,
    },
  ];

  void _checkAnswer(int selectedOptionIndex) {
    int correctIndex = _quizData[_currentQuestionIndex]['correctIndex'];
    if (selectedOptionIndex == correctIndex) {
      // The answer is correct
      // You can add your logic for scoring or feedback here
      print('Correct!');
    } else {
      // The answer is wrong
      print('Wrong!');
    }

    // Move to the next question
    if (_currentQuestionIndex < _quizData.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      // Quiz is over
      print('Quiz Completed');
      // You can add your logic for quiz completion here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _currentQuestionIndex < _quizData.length
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _quizData[_currentQuestionIndex]['question'],
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              for (var i = 0;
              i < _quizData[_currentQuestionIndex]['options'].length;
              i++)
                ElevatedButton(
                  onPressed: () {
                    _checkAnswer(i);
                  },
                  child: Text(
                    _quizData[_currentQuestionIndex]['options'][i],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
            ],
          ),
        ],
      )
          : Center(
        child: Text(
          'Quiz Completed!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
