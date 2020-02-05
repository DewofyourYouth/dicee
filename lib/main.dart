import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDieNum = 1;
  int rightDieNum = 1;

  int rollDie() {
    var random = new Random();
    return 1 + random.nextInt(6);
  }

  rollDice() {
    setState(() {
      leftDieNum = rollDie();
      rightDieNum = rollDie();
    });
    print("left: $leftDieNum, right: $rightDieNum");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: rollDice,
              child: Image.asset('images/dice$leftDieNum.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: rollDice,
              child: Image.asset('images/dice$rightDieNum.png'),
            ),
          ),
        ],
      ),
    );
  }
}
