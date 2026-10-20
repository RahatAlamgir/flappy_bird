import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/constant/assets.dart';
import 'package:flappy_bird/constant/config.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Thorns extends SpriteComponent
    with CollisionCallbacks, HasGameReference<FlappyBirdGame> {
  Thorns(Vector2 position, Vector2 size, {required this.isTopThorn})
    : super(position: position, size: size);

  final bool isTopThorn;
  bool scored = false;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(isTopThorn ? Assets.pipeRotated : Assets.pipe);
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position..x -= Config.groundScrollingSpeed * dt;

    if (!scored && position.x + size.x < game.bird.position.x) {
      scored = true;
      if (isTopThorn) {
        game.incrementScore();
      }
    }
    if (position.x + size.x <= 0) {
      removeFromParent();
    }
    super.update(dt);
  }
}
