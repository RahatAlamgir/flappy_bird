import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/game/assets.dart';

class Background extends SpriteComponent {
  Background(Vector2 size) : super(position: Vector2(0, 0), size: size);

  @override
  FutureOr<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);

    sprite = Sprite(background);
    return super.onLoad();
  }
}
