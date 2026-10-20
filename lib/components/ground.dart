import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'package:flappy_bird/constant/assets.dart';
import 'package:flappy_bird/constant/config.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Ground extends SpriteComponent
    with HasGameReference<FlappyBirdGame>, CollisionCallbacks {
  Ground();

  @override
  FutureOr<void> onLoad() async {
    // final ground = await Flame.images.load(Assets.ground);

    size = Vector2(2 * game.size.x, Config.groundHeight);
    position = Vector2(0, game.size.y - Config.groundHeight);
    sprite = await Sprite.load(Assets.ground);
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.x -= Config.groundScrollingSpeed * dt;

    if (position.x + size.x / 2 <= 0) {
      position.x = 0;
    }
    super.update(dt);
  }
}
