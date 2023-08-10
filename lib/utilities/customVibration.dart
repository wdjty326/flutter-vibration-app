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
      patternType: 3,
      patternList: [0, 1000 * 60 * 60 * 24]);
  //breadpare(
  //  patternName: '빵파레',
  //  patternList: [
  //    0,
  //    300,
  //    50,
  //    100,
  //    50,
  //    3000,
  //    500,
  //    100,
  //    50,
  //    100,
  //    50,
  //    100,
  //    300,
  //    50,
  //    100,
  //    50,
  //    3000,
  //  ],
  //  patternType: 4,
  //); // 하루동안울림

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

  static bool vibrate(int amplitude) {
    debugPrint('vibate@${amplitude.toString()}');
    if (amplitude == 0) return false; // 진동이 0이면 실행하지 않음
    if (!_isVibrate) {
      Vibration.vibrate(
          pattern: _pattern.patternList,
          repeat: 1,
          amplitude: amplitude,
          intensities: [0, amplitude]);
    }
    _isVibrate = true;
    return true;
  }

  static void pattern(CustomVibrationPattern pattern) {
    _pattern = pattern;
  }

  static void cancel() {
    debugPrint('cancel');
    try {
      if (_isVibrate) Vibration.cancel();
    } on Exception catch (e) {
      debugPrint('cancel:$e');
    }
    _isVibrate = false;
  }
}
