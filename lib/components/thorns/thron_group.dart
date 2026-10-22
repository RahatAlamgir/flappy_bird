import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/thorns/thorn.dart';
import 'package:flappy_bird/components/thorns/thorn_position.dart';
import 'package:flappy_bird/constant/config.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class ThronGroup extends PositionComponent
    with HasGameReference<FlappyBirdGame> {
  ThronGroup();

  final _random = Random();
  bool _scored = false;

  @override
  FutureOr<void> onLoad() async {
    position.x = game.size.x;

    final heightMinusGround = game.size.y - Config.groundHeight;
    final spacing =
        Config.thornGap + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusGround - spacing);

    addAll([
      Thorn(thornPosition: ThornPosition.top, height: centerY - spacing / 2),
      Thorn(
        thornPosition: ThornPosition.bottom,
        height: heightMinusGround - (centerY + spacing / 2),
      ),
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.x -= Config.gameSpeed * dt;
    if (!_scored && position.x < game.bird.x) {
      game.bird.updateScore();
      _scored = true;
    }

    if (isMounted && position.x < -40) {
      removeFromParent();
    }

    super.update(dt);
  }
}
