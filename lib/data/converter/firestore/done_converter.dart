import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/common_util.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';

Done doneFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
    ) {
  return Done.fromJson(snapshot.data()!);
}

Map<String, Object?> doneToFirestore(
    Done model,
    SetOptions? options,
    ) {
  final startDate = model.startDate;
  final endDate = model.endDate;
  return {
    ...model.toJson(),
    if (model.user != null) "user": model.user?.toJson(),
    if (model.user?.id != null) "userRef": getUserRef(model.user?.id),
    if (startDate != null) "startDate": Timestamp.fromDate(startDate),
    if (endDate != null) "endDate": serverTimestamp(),
  };
}

