import 'package:firebase_database/firebase_database.dart';

Future<Object?> getVibrationPatterns() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('/vibration_pattern').get();
  return snapshot.value;
}
