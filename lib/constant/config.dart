import 'package:flame/game.dart';

class Config {
  static const double gameSpeed = 100;

  // Bird
  static const double _birdStartX = 100;
  static const double _birdStartY = 300;
  static Vector2 birdPosition = Vector2(_birdStartX, _birdStartY);

  static const double _birdWidth = 60;
  static const double _birdheight = 50;
  static Vector2 birdSize = Vector2(_birdWidth, _birdheight);

  static const double gravity = -110;
  static const double birdVelocity = 240;

  // Ground
  static const double groundHeight = 130;
  static const double groundScrollingSpeed = 100;

  //thorns
  static const double thornDelay = 2.3;
  static const double thornGap = 160;
}
