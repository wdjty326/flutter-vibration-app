/// 바이브레이션 패턴 모델
/// firebase `flutter_vibration_pattern` 모델
class PatternModel {
  final String _patternId;
  final Map<String, String> _patternName;
  final List<int> _patternNums;

  PatternModel(this._patternId, this._patternName, this._patternNums);

  PatternModel.fromJson(Map<String, dynamic> parsedJson)
      : _patternId = parsedJson['patternId'],
        _patternName = parsedJson['patternName'],
        _patternNums = parsedJson['patternNums'];

  String get patternId => _patternId;
  Map<String, String> get patternName => _patternName;
  List<int> get patternNums => _patternNums;
}
