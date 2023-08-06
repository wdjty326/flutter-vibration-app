import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

enum CustomVibrationPattern {
  normal(patternName: '기본패턴', patternType: 1, patternList: [0, 1000]), // 기본
  bounce(
      patternName: '바운스',
      patternType: 2,
      patternList: [100, 300, 100, 500]), // 바운스
  daily(
      patternName: '하루종일',
      patternType: 2,
      patternList: [0, 1000 * 60 * 60 * 24]); // 하루동안울림

  final String patternName;
  final int patternType;
  final List<int> patternList;

  const CustomVibrationPattern({
    required this.patternName,
    required this.patternType,
    required this.patternList,
  });
}

class CustomVibration {
  static bool _isVibrate = false;
  static CustomVibrationPattern _pattern = CustomVibrationPattern.normal;

  static Future<bool> hasVibrator() async {
    bool? hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator == null || !hasVibrator) return false;
    return _isVibrate;
  }

  static void vibrate(int amplitude) {
    debugPrint('vibate@${amplitude.toString()}');

    if (!_isVibrate) {
      Vibration.vibrate(
          pattern: _pattern.patternList, repeat: 1, amplitude: amplitude);
    }
    _isVibrate = true;
  }

  static void pattern(CustomVibrationPattern pattern) {
    _pattern = pattern;
  }

  static void cancel() {
    debugPrint('cacnel');

    if (_isVibrate) Vibration.cancel();
    _isVibrate = false;
  }
}
