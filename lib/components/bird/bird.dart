import 'dart:async';

import 'package:flame_audio/flame_audio.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_bird/components/bird/bird_movement.dart';
import 'package:flappy_bird/components/thorns/thorn.dart';
import 'package:flappy_bird/constant/config.dart';
import 'package:flappy_bird/constant/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/service/score_data.dart';
import 'package:flutter/material.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameReference<FlappyBirdGame>, CollisionCallbacks {
  Bird() : super(position: Config.birdPosition, size: Config.birdSize);
  double velocity = 0;
  int score = 0;

  @override
  FutureOr<void> onLoad() async {
    final birdMidFlap = await game.loadSprite(Assets.birdMid);
    final birdUpFlap = await game.loadSprite(Assets.birdUp);
    final birdDownFlap = await game.loadSprite(Assets.birdDown);

    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap,
    };
    current = BirdMovement.middle;

    add(CircleHitbox());

    return super.onLoad();
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down,
      ),
    );

    current = BirdMovement.up;
  }

  @override
  void update(double dt) {
    velocity += Config.gravity * dt;

    position.y += Config.birdVelocity * dt;
    super.update(dt);
  }

  void gameOver() {
    if (ScoreData.bestScore < score) {
      ScoreData.addScore(score);
    }
    FlameAudio.play(Assets.collision);

    game.score.text = '';
    game.overlays.add('gameOver');
    game.pauseEngine();
  }

  void reset() {
    position = Config.birdPosition;
    score = 0;
  }

  void updateScore() {
    FlameAudio.play(Assets.point);
    score++;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    gameOver();
  }
}
