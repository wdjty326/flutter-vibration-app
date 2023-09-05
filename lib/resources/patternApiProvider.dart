import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/patternModal.dart';

class PatternApiProvider {
  final db = FirebaseFirestore.instance;

  Future<List<PatternModel>> fetchPatternList() async {
    return await db.collection('vibration_pattern').get().then((event) {
      List<PatternModel> list = [];
      for (var doc in event.docs) {
        final json = doc.data();
        json.addAll(<String, dynamic>{'patternId': doc.id});
        list.add(PatternModel.fromJson(json));
      }
      return list;
    });
  }
}
