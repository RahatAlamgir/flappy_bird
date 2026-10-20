import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/score_text.dart';
import 'package:flappy_bird/components/thorns/thorns.dart';
import 'package:flappy_bird/components/thorns/thorns_manager.dart';
import 'package:flappy_bird/constant/config.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame
    with TapCallbacks, HasCollisionDetection {
  late Bird bird;
  late Background background;
  late Ground ground;
  late ThornsManager thornsManager;
  late ScoreText scoreText;

  bool isGameOver = false;
  int score = 0;

  @override
  FutureOr<void> onLoad() async {
    background = Background(size);
    add(background);

    bird = Bird();
    add(bird);

    thornsManager = ThornsManager();
    add(thornsManager);

    ground = Ground();
    add(ground);

    scoreText = ScoreText();
    add(scoreText);

    return super.onLoad();
  }

  void incrementScore() {
    score++;
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (isGameOver) {
      resetGame();
      return;
    }
    bird.flap();
    super.onTapDown(event);
  }

  void gameOver() {
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine();

    showDialog(
      context: buildContext!,

      builder: (constext) => AlertDialog(
        title: const Text("Game Over"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(constext);
              resetGame();
            },
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }

  void resetGame() {
    bird.position = Config.birdPosition;
    bird.velocity = 0;
    score = 0;
    isGameOver = false;
    children.whereType<Thorns>().forEach((thorn) => thorn.removeFromParent());
    resumeEngine();
  }
}
