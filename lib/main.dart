import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions =  const [
    {
      'questionText': 'プログラミング経験はどれくらい？',
      'answers': [
        {'text': '5年~', 'score': 10},
        {'text': '3~5年', 'score': 5},
        {'text': '1~3年', 'score': 3},
        {'text': '1年未満', 'score': 1},
      ],
    },
    {
      'questionText': '自分でアプリケーション作成経験は？',
      'answers': [
        {'text': 'いくつかある', 'score': 10},
        {'text': '1,2個ある', 'score': 5},
        {'text': 'コピペで作ったくらい', 'score': 3},
        {'text': '全くない', 'score': 1},
      ],
    },
    {
      'questionText': 'Flutter、Dartの文法をどれくらい知ってる？',
      'answers': [
        {'text': '完璧に理解している', 'score': 10},
        {'text': 'だいたい書ける', 'score': 5},
        {'text': '調べればなんとか書ける', 'score': 3},
        {'text': '全く分からない', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length ?
          Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions
          )
            :
          Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
