import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/thorns/thorns.dart';
import 'package:flappy_bird/constant/config.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class ThornsManager extends Component with HasGameReference<FlappyBirdGame> {
  double thornSpawnTimer = 0;

  @override
  void update(double dt) {
    thornSpawnTimer += dt;

    if (thornSpawnTimer > Config.thornDelay) {
      thornSpawnTimer = 0;
      spawnThorn();
    }
    super.update(dt);
  }

  void spawnThorn() {
    final double screenHeight = game.size.y;

    final double maxThronHeight =
        screenHeight -
        Config.groundHeight -
        Config.thornGap -
        Config.minThornHeight;

    final double bottomThornHeight =
        Config.minThornHeight +
        Random().nextDouble() * (maxThronHeight - Config.minThornHeight);

    final double topThornHeight =
        screenHeight -
        Config.groundHeight -
        bottomThornHeight -
        Config.thornGap;

    final bottomThorn = Thorns(
      Vector2(
        game.size.x,
        screenHeight - Config.groundHeight - bottomThornHeight,
      ),
      Vector2(Config.thornWidth, bottomThornHeight),
      isTopThorn: false,
    );
    final topThorn = Thorns(
      Vector2(game.size.x, 0),
      Vector2(Config.thornWidth, topThornHeight),
      isTopThorn: true,
    );
    game.add(bottomThorn);
    game.add(topThorn);
  }
}
