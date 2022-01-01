import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/models/handle_enum.dart';
import 'package:focus_cafe_flutter/data/models/realtime_update.dart';
import 'package:focus_cafe_flutter/data/models/realtime_update_type.dart';
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

Future<List<T>> getModelsWithConverter<T>(
    Query query,
    Query<T> Function(Query query) converter,
    ) async {
  final q = converter(query);
  return (await q.get()).docs.map((doc) => doc.data()).toList();
}

Stream<R> onRealtimeUpdate<T, R extends RealtimeUpdate>(Stream<QuerySnapshot<T>> snapshots, R f(T data)) async* {
  await for (final snapshot in snapshots) {
    final changes = snapshot.docChanges;
    for (final change in changes) {
      final data = change.doc.data();
      if (data != null) {
        RealtimeUpdateType updateType = HandleEnum.convertRealtimeUpdateType(HandleEnum.enumToString(change.type));
        final model = f(data);
        model.updateType = updateType;
        yield model;
      }
    }
  }
}
