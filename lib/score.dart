import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({super.key, required this.totalScore, required this.round});

  final int totalScore;
  final int round;

  @override
  Widget build(BuildContext context) {
    return Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () { 
                    
                  }, 
                  child: const Text('Restart')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const <Widget>[
                      Text('Score: '),
                      Text('99'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const <Widget>[
                      Text('Round: '),
                      Text('3'),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () { 
                    
                  }, 
                  child: const Text('Info')),
            ],)  ;
  }
}