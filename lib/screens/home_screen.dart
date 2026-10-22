import 'package:flame/game.dart';
import 'package:flappy_bird/constant/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/screens/game_over_screen.dart';
import 'package:flappy_bird/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final game = FlappyBirdGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: .center,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(Assets.background, fit: .fitHeight),
            ),
            Column(
              mainAxisAlignment: .center,
              children: [
                SizedBox(width: 100, child: Image.asset(Assets.birdLogo)),
                SizedBox(
                  width: 300,
                  child: Image.asset(Assets.flappyBird, fit: .fitWidth),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameWidget(
                          game: game,
                          initialActiveOverlays: [MainMenuScreen.id],
                          overlayBuilderMap: {
                            'mainMenu': (context, _) =>
                                MainMenuScreen(game: game),
                            'gameOver': (context, _) =>
                                GameOverScreen(game: game),
                          },
                        ),
                      ),
                    );
                  },
                  child: Text("Start"),
                ),
                Text(
                  "Best Score: 100",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Game',
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
