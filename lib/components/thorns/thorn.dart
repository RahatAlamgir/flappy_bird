import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/components/thorns/thorn_position.dart';
import 'package:flappy_bird/constant/assets.dart';
import 'package:flappy_bird/constant/config.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Thorn extends SpriteComponent with HasGameReference<FlappyBirdGame> {
  Thorn({required this.thornPosition, required this.height});

  @override
  final double height;
  final ThornPosition thornPosition;

  @override
  FutureOr<void> onLoad() async {
    final thornBottom = await Flame.images.load(Assets.thornBottom);
    final thornTop = await Flame.images.load(Assets.thornTop);
    size = Vector2(50, height);

    switch (thornPosition) {
      case ThornPosition.top:
        position.y = 0;
        sprite = Sprite(thornTop);
        break;
      case ThornPosition.bottom:
        position.y = game.size.y - size.y - Config.groundHeight;
        sprite = Sprite(thornBottom);
        break;
    }
    add(RectangleHitbox());

    return super.onLoad();
  }
}
