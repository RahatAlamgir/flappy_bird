import 'package:flappy_bird/constant/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key, required this.game});

  final FlappyBirdGame game;
  static const String id = 'mainMenu';

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove("mainMenu");
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.background),
              fit: .cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Image.asset(Assets.flappyBird),
              SizedBox(height: 10),
              Image.asset(Assets.getReady),
              SizedBox(height: 40),
              Image.asset(Assets.tap),
            ],
          ),
        ),
      ),
    );
  }
}
