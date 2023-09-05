import 'package:flutter_application_1/models/patternModal.dart';
import 'package:flutter_application_1/resources/patternApiProvider.dart';

class Repository {
  final patternApiProvider = PatternApiProvider();

  Future<List<PatternModel>?> fetchPatternList() =>
      patternApiProvider.fetchPatternList();
}
