import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/common_util.dart';
import 'package:focus_cafe_flutter/data/models/activity.dart';

DocumentReference<Activity> activityConverter(DocumentReference doc) {
  return doc
      .withConverter<Activity>(
      fromFirestore: activityFromFirestore,
      toFirestore: activityToFirestore
  );
}

Query<Activity> activityQueryConverter(Query query) {
  return query
      .withConverter<Activity>(
      fromFirestore: activityFromFirestore,
      toFirestore: activityToFirestore
  );
}

Activity activityFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
    ) {
  return Activity.fromJson(snapshot.data()!);
}

Map<String, Object?> activityToFirestore(
    Activity model,
    SetOptions? options,
    ) {
  return {
    "id": model.id,
    "dates": model.dates.map((date) => Timestamp.fromDate(date))
  };
}

