import 'package:shared_preferences/shared_preferences.dart';

class ScoreData {
  static int bestScore = 0;

  static Future<void> addScore(int score) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', score);
    bestScore = score;
  }

  static Future<void> loadScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bestScore = prefs.getInt('score') ?? 0;
  }
}
