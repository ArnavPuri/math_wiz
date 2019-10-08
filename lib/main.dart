import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MathQuizPage(),
  ));
}

class MathQuizPage extends StatefulWidget {
  @override
  _MathQuizPageState createState() => _MathQuizPageState();
}

class _MathQuizPageState extends State<MathQuizPage> {
  int num1;
  int num2;
  int score = 0;
  TextEditingController inputManager = TextEditingController();

  @override
  Widget build(BuildContext context) {
    updateNumbers();
    return Scaffold(
      backgroundColor: Color(0xFFEEFFD6),
      appBar: AppBar(
        title: Text('MathWiz'),
        backgroundColor: Color(0xFF2ABE07),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$num1 + $num2',
                style: TextStyle(fontSize: 64, color: Color(0xFF0778BE)),
              ),
              Text('=',
                  style: TextStyle(fontSize: 32, color: Color(0xFF0778BE))),
              Container(
                width: 80,
                height: 50,
                child: TextField(
                  cursorColor: Color(0xFF0778BE),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF0778BE), fontSize: 24),
                  controller: inputManager,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                      filled: true,
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                      fillColor: Colors.white),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Center(
                child: RaisedButton(
                  onPressed: checkAnswer,
                  child: Text('CHECK',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  color: Color(0xFF2ABE07),
                  padding: EdgeInsets.all(12),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: RaisedButton(
                  onPressed: updateNumbers,
                  child: Text('SKIP',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  color: Color(0xFF0778BE),
                  padding: EdgeInsets.all(12),
                ),
              ),
            ],
          ),
          Text(
            'Score: $score',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 72, color: Color(0xFF2ABE07)),
          )
        ],
      ),
    );
  }

  updateNumbers() {
    setState(() {
      num2 = Random().nextInt(70);
      num1 = Random().nextInt(70);
      inputManager.clear();
    });

  }

  void checkAnswer() {

    setState(() {

      if (inputManager.text.isNotEmpty && (num1 + num2) == int.parse(inputManager.text)) {
        score += 10;
      } else {
        score -= 5;
      }
      inputManager.clear();
    });
  }
}
