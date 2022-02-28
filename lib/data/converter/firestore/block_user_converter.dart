import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/models/block_user.dart';

DocumentReference<BlockUser> blockUserConverter(DocumentReference doc) {
  return doc
      .withConverter<BlockUser>(
      fromFirestore: blockUserFromFirestore,
      toFirestore: blockUserToFirestore
  );
}

Query<BlockUser> blockUserQueryConverter(Query query) {
  return query
      .withConverter<BlockUser>(
      fromFirestore: blockUserFromFirestore,
      toFirestore: blockUserToFirestore
  );
}

BlockUser blockUserFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
    ) {
  return BlockUser.fromJson(snapshot.data()!);
}

Map<String, Object?> blockUserToFirestore(
    BlockUser model,
    SetOptions? options,
    ) {
  final createdAt = model.createdAt;
  return {
    ...model.toJson(),
    if (createdAt != null) "createdAt": Timestamp.fromDate(createdAt),
  };
}
