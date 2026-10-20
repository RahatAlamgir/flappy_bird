import 'package:flame/game.dart';

class Config {
  // Bird
  static const double _birdStartX = 100;
  static const double _birdStartY = 100;
  static Vector2 birdPosition = Vector2(_birdStartX, _birdStartY);

  static const double _birdWidth = 60;
  static const double _birdheight = 50;
  static Vector2 birdSize = Vector2(_birdWidth, _birdheight);

  static const double gravity = 800;
  static const double jumpStrenght = -300;

  // Ground
  static const double groundHeight = 100;
  static const double groundScrollingSpeed = 100;

  //thorns
  static const double thornDelay = 2;
  static const double thornGap = 150;
  static const double minThornHeight = 50;
  static const double thornWidth = 60;
}
