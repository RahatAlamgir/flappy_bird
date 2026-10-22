import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappy_bird/components/background/ground.dart';
import 'package:flutter/painting.dart';

import 'package:flame/game.dart';
import 'package:flappy_bird/components/background/background.dart';
import 'package:flappy_bird/components/bird/bird.dart';

import 'package:flappy_bird/components/thorns/thron_group.dart';
import 'package:flappy_bird/constant/config.dart';

class FlappyBirdGame extends FlameGame
    with TapCallbacks, HasCollisionDetection {
  late Bird bird;
  late TextComponent score;
  Timer thornDelay = Timer(Config.thornDelay, repeat: true);

  @override
  Future<void> onLoad() async {
    bird = Bird();

    addAll([
      Background(),
      bird,
      Ground(),
      score = buildScore(),
      //thornsManager, scoreText
    ]);
    thornDelay.onTick = () => add(ThronGroup());

    return super.onLoad();
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x / 2, size.y - 60),
      anchor: Anchor.bottomCenter,
      textRenderer: TextPaint(
        style: TextStyle(fontFamily: 'Game', fontSize: 40, fontWeight: .bold),
      ),
    );
  }

  @override
  void onTapDown(TapDownEvent event) {
    bird.fly();
    super.onTapDown(event);
  }

  @override
  void update(double dt) {
    thornDelay.update(dt);
    score.text = 'Score: ${bird.score}';
    super.update(dt);
  }
}
