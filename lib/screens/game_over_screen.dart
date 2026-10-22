import 'package:flappy_bird/components/thorns/thron_group.dart';
import 'package:flappy_bird/constant/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/screens/home_screen.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key, required this.game});

  final FlappyBirdGame game;
  static const String id = 'gameOver';

  void _onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.children.whereType<ThronGroup>().toList().forEach((thorn) {
      if (thorn.isMounted) {
        thorn.removeFromParent();
      }
    });

    game.thornDelay.reset();
    game.resumeEngine();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              "Score: ${game.bird.score}",
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: "Game",
              ),
            ),
            Image.asset(Assets.gameOver),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _onRestart, child: Text('Restart')),
            ElevatedButton(
              onPressed: () {
                game.bird.reset();
                game.overlays.remove('gameOver');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Main Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
