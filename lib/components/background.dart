import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/constant/assets.dart';

class Background extends SpriteComponent {
  Background(Vector2 size) : super(position: Vector2(0, 0), size: size);

  @override
  FutureOr<void> onLoad() async {
    //final background = await Flame.images.load(Assets.background);

    sprite = await Sprite.load(Assets.background);
    return super.onLoad();
  }
}
