import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:math';
import 'dart:core';

import 'control.dart';
import 'prompt.dart';
import 'game_model.dart';
import 'score.dart';
import 'hitme_button.dart';
import 'styled_button.dart';

void main() {
  runApp(const BullseyeApp());
}

class BullseyeApp extends StatelessWidget {
  const BullseyeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return const MaterialApp(
      title: 'Bullseye',
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(_newTargetValue());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('images/background.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Prompt(targetValue: _model.target,),
              Control(model: _model,),
              HitMeButton(
                text: 'HIT ME',
                onPressed: () {
                  _showAlert(context);
                },
              ),
              Score(totalScore: _model.totalScore, round: _model.round, onStartOver: _startNewGame,)
            ],
      
          ),
        ),
      ),
    );
  }

  int _pointsForCurrentRound(){
    const maximumScore = 100;
    var difference = _differenceAmount();
    var bonus = 0;

    if (difference == 0) {
      bonus = 100;
    } else if (difference == 1) {
      bonus = 50;
    }

    var points = maximumScore - difference + bonus;
    return points;
  }

  int _differenceAmount() => (_model.target - _model.current).abs();
  int _newTargetValue() => Random().nextInt(100) + 1;

  void _startNewGame() {
    setState(() {
      _model.totalScore = GameModel.scoreStart;
      _model.round = GameModel.roundStart;
      _model.current = GameModel.sliderStart;
      _model.target = _newTargetValue();
    });
  }

  String _alertTitle() {
    var difference = _differenceAmount();

    String title;
    if (difference == 0) {
      title = "Perfect!";
    } else if (difference < 5) {
      title = "You almost had it!";
    } else if (difference <= 10) {
      title = "Not bad.";
    } else {
      title = "Are you even trying?";
    }
    return title;
  }

  void _showAlert(BuildContext context) {
    var okButton = StyledButton(
      icon: Icons.close,
      onPressed: () {
        Navigator.of(context).pop();
        setState(() {
          _model.totalScore += _pointsForCurrentRound();
          _model.target = _newTargetValue();
          _model.round++;
        });
      },
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(_alertTitle()),
            content: Text('The slider\'s value is ${_model.current}\n'
                'You scored ${_pointsForCurrentRound()} points this round'),
            actions: [okButton],
            elevation: 5,
          );
        }
    );
  }
}