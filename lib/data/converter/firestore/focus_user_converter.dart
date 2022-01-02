import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/models/focus_user.dart';

DocumentReference<FocusUser> focusUserConverter(DocumentReference doc) {
  return doc
      .withConverter<FocusUser>(
      fromFirestore: focusUserFromFirestore,
      toFirestore: focusUserToFirestore
  );
}

Query<FocusUser> focusUserQueryConverter(Query query) {
  return query
      .withConverter<FocusUser>(
      fromFirestore: focusUserFromFirestore,
      toFirestore: focusUserToFirestore
  );
}

FocusUser focusUserFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
    ) {
  return FocusUser.fromJson(snapshot.data()!);
}

Map<String, Object?> focusUserToFirestore(
    FocusUser model,
    SetOptions? options,
    ) {
  final startDate = model.startDate;
  return {
    ...model.toJson(),
    if (model.user != null) "user": model.user?.toJson(),
    if (startDate != null) "startDate": Timestamp.fromDate(startDate),
  };
}
