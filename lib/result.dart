import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';

    if (resultScore <= 8) {
      resultText = 'まずはFlutter, Dartの基礎文法から';
    } else if (resultScore <= 12) {
      resultText = 'チュートリアルに沿ってアプリを作成しよう';
    } else if (resultScore <= 16) {
      resultText = 'オリジナルのアプリを作ろう！';
    } else {
      resultText = 'もう余裕！何も言うことはねえ！';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('はじめから'),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ]
      )
    );
  }
}
