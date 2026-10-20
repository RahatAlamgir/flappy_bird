import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/bird/bird_constants.dart';
import 'package:flappy_bird/game/assets.dart';

class Bird extends SpriteComponent {
  Bird()
    : super(
        position: Vector2(BirdConstants.birdStartX, BirdConstants.birdStartY),
        size: Vector2(BirdConstants.birdWidth, BirdConstants.birdheight),
      );

  double velocity = 0;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(Assets.birdMidFlap);

    return super.onLoad();
  }

  void flap() {
    velocity = BirdConstants.jumpStrenght;
  }

  @override
  void update(double dt) {
    velocity += BirdConstants.gravity * dt;

    position.y += velocity * dt;
    super.update(dt);
  }
}
