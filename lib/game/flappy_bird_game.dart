import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird/bird.dart';

class FlappyBirdGame extends FlameGame with TapCallbacks {
  late Bird bird;
  late Background background;
  @override
  FutureOr<void> onLoad() async {
    background = Background(size);
    add(background);

    bird = Bird();
    add(bird);
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    bird.flap();
    super.onTapDown(event);
  }
}
