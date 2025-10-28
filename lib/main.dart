import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Bullseye',
      home: GamePage(),
    ),
  );
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Bullseye', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green
            ),
            ),
            TextButton(
              child: Text('Hit me', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                _showAlert(context);
                // printHello();
              },
            ),
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
          content: const Text('This is my first pop-up'),
          actions: [okButton],
          elevation: 5,
        );
      }
      );
  }
}