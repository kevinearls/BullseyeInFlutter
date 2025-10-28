import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Bullseye',
      // home: Scaffold(
      //   appBar: AppBar(title: const Text('Bullseye')),
      //   body: const Center(child: Text('Hello Earthling!')),
      // ),
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
                print('WTF?');
              },
            ),
          ],
        ),
      ),
    );
  }
}