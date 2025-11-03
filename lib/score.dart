import 'package:bullseye/text_styles.dart';
import 'package:flutter/material.dart';
import 'styled_button.dart';

class Score extends StatelessWidget {
  const Score({super.key, required this.totalScore, required this.round, required this.onStartOver});

  final int totalScore;
  final int round;
  final VoidCallback onStartOver;

  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StyledButton(
          icon: Icons.refresh, 
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Column(
            children: <Widget>[
              Text('Score: ', style: LabelTextStyle.bodyText1(context)),
              Text('$totalScore', style: ScoreNumberTextStyle.headline4(context),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Column(
            children: <Widget>[
              Text('Round: ', style: LabelTextStyle.bodyText1(context)),
              Text('$round', style: ScoreNumberTextStyle.headline4(context)),
            ],
          ),
        ),
        StyledButton(
          icon: Icons.info, 
          onPressed: () {},
        ),
            
      ],)  ;

  }
}