import 'package:flutter_application_1/models/patternModal.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_application_1/resources/repository.dart';

class PatternBloc {
  final _repository = Repository();
  final _patternFetcher = PublishSubject<List<PatternModel>>();

  //Obs<List<PatternModel>> get allPatterns => _patternFetcher.stream;
}
