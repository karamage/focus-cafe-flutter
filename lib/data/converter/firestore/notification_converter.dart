import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/common_util.dart';
import 'package:focus_cafe_flutter/data/models/handle_enum.dart';
import 'package:focus_cafe_flutter/data/models/notification.dart';

DocumentReference<Notification> notificationConverter(DocumentReference doc) {
  return doc
      .withConverter<Notification>(
      fromFirestore: notificationFromFirestore,
      toFirestore: notificationToFirestore
  );
}

Query<Notification> notificationQueryConverter(Query query) {
  return query
      .withConverter<Notification>(
      fromFirestore: notificationFromFirestore,
      toFirestore: notificationToFirestore
  );
}

Notification notificationFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
    ) {
  return Notification.fromJson(snapshot.data()!);
}

Map<String, Object?> notificationToFirestore(
    Notification model,
    SetOptions? options,
    ) {
  final createdAt = model.createdAt;
  return {
    ...model.toJson(),
    "type": HandleEnum.enumToString(model.type),
    if (model.toUser != null) "toUser": model.toUser?.toJson(),
    if (model.toUser?.id != null) "userRef": getUserRef(model.toUser?.id),
    if (model.fromUser != null) "fromUser": model.fromUser?.toJson(),
    if (createdAt != null) "createdAt": serverTimestamp(),
  };
}

