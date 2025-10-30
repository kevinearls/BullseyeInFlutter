import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'control.dart';
import 'prompt.dart';
import 'game_model.dart';
import 'score.dart';

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
    _model = GameModel(50);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Prompt(targetValue: 100,),
            Control(model: _model,),
            TextButton(
              child: Text('Hit me', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                _showAlert(context);
              },
            ),
            Score(totalScore: _model.totalScore, round: _model.round)
          ],

        ),

      ),
    );
  }

  void _showAlert(BuildContext context) {
    var okButton = TextButton(
      child: const Text('Awesome!'),
      onPressed: () {
        Navigator.of(context).pop();

        print('Awesome pressed! ');
      },
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Hello there!'),
            content: Text('The slider\'s value is ${_model.current}'),
            actions: [okButton],
            elevation: 5,
          );
        }
    );
  }
}