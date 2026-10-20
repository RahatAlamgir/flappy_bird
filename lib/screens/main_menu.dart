import 'package:flame/game.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Flappy Bird"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameWidget(game: FlappyBirdGame()),
                  ),
                );
              },
              child: Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}
