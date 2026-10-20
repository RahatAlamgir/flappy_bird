import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScoreText extends TextComponent with HasGameReference<FlappyBirdGame> {
  ScoreText()
    : super(
        text: '0',
        textRenderer: TextPaint(
          style: TextStyle(color: Colors.grey.shade900, fontSize: 48),
        ),
      );

  @override
  FutureOr<void> onLoad() {
    position = Vector2((game.size.x - size.x) / 2, game.size.y - size.y - 50);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final newText = game.score.toString();
    if (text != newText) {
      text = newText;
    }
    super.update(dt);
  }
}
