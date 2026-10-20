import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/thorns/thorns.dart';
import 'package:flappy_bird/constant/config.dart';
import 'package:flappy_bird/constant/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
  Bird() : super(position: Config.birdPosition, size: Config.birdSize);

  double velocity = 0;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(Assets.bird);

    //add(RectangleHitbox());
    add(CircleHitbox());

    return super.onLoad();
  }

  void flap() {
    velocity = Config.jumpStrenght;
  }

  @override
  void update(double dt) {
    velocity += Config.gravity * dt;

    position.y += velocity * dt;
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);

    if (other is Ground) {
      (parent as FlappyBirdGame).gameOver();
    }
    if (other is Thorns) {
      (parent as FlappyBirdGame).gameOver();
    }
  }
}
