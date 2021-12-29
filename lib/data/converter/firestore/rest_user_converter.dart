import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';

DocumentReference<RestUser> restUserConverter(DocumentReference doc) {
  return doc
      .withConverter<RestUser>(
      fromFirestore: restUserFromFirestore,
      toFirestore: restUserToFirestore
  );
}

Query<RestUser> restUserQueryConverter(Query query) {
  return query
      .withConverter<RestUser>(
      fromFirestore: restUserFromFirestore,
      toFirestore: restUserToFirestore
  );
}

RestUser restUserFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
    ) {
  return RestUser.fromJson(snapshot.data()!);
}

Map<String, Object?> restUserToFirestore(
    RestUser model,
    SetOptions? options,
    ) {
  final startDate = model.startDate;
  return {
    ...model.toJson(),
    if (model.user != null) "user": model.user?.toJson(),
    if (startDate != null) "startDate": Timestamp.fromDate(startDate),
  };
}
