import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/common_util.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';

DocumentReference<User> userConverter(DocumentReference doc) {
  return doc
      .withConverter<User>(
      fromFirestore: userFromFirestore,
      toFirestore: userToFirestore
  );
}

Query<User> userQueryConverter(Query query) {
  return query
      .withConverter<User>(
      fromFirestore: userFromFirestore,
      toFirestore: userToFirestore
  );
}

User userFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
    ) {
  return User.fromJson(snapshot.data()!);
}

Map<String, Object?> userToFirestore(
    User model,
    SetOptions? options,
    ) {
  return model.toJson();
}

