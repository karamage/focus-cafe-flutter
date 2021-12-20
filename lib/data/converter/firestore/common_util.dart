import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/util/constants.dart';

late FirebaseFirestore _db = FirebaseFirestore.instance;
String getNewFirestoreId() => _db.collection('_').doc().id;
DocumentReference getUserRef(uuid) => _db.collection(USERS_PATH).doc(uuid);
FieldValue serverTimestamp() => FieldValue.serverTimestamp();

Future<DocumentReference<T>> setWithConverter<T>(
    String collectionPath,
    String documentId,
    T params,
    DocumentReference<T> Function(DocumentReference doc) converter,
    ) async {
  DocumentReference<T> doc = converter(_db.collection(collectionPath).doc(documentId));
  await doc.set(params, SetOptions(merge: true));
  return doc;
}

