import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird/constant/assets.dart';
import 'package:flappy_bird/constant/config.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Background extends ParallaxComponent<FlappyBirdGame> {
  Background();

  @override
  FutureOr<void> onLoad() async {
    //final background = await Flame.images.load(Assets.background);
    final layer1 = await Flame.images.load(Assets.layer1);
    final layer2 = await Flame.images.load(Assets.layer2);
    final layer3 = await Flame.images.load(Assets.layer3);
    final layer4 = await Flame.images.load(Assets.layer4);
    final layer5 = await Flame.images.load(Assets.layer5);

    parallax = Parallax(baseVelocity: Vector2(Config.gameSpeed, 0), [
      ParallaxLayer(ParallaxImage(layer1, fill: LayerFill.height)),

      ParallaxLayer(
        ParallaxImage(layer2, fill: LayerFill.height),
        velocityMultiplier: Vector2(0.4, 0),
      ),

      ParallaxLayer(
        ParallaxImage(layer3, fill: LayerFill.height),
        velocityMultiplier: Vector2(0.6, 0),
      ),

      ParallaxLayer(
        ParallaxImage(layer4, fill: LayerFill.height),
        velocityMultiplier: Vector2(0.8, 0),
      ),

      ParallaxLayer(
        ParallaxImage(layer5, fill: LayerFill.height),
        velocityMultiplier: Vector2(1.0, 0),
      ),
    ]);

    add(
      RectangleHitbox(
        position: Vector2(0, game.size.y - Config.groundHeight),
        size: Vector2(game.size.x, Config.groundHeight),
      ),
    );
    add(
      RectangleHitbox(position: Vector2(0, 0), size: Vector2(game.size.x, 2)),
    );
    return super.onLoad();
  }
}
