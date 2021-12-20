import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/common_util.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/done_converter.dart';
import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/handle_enum.dart';
import 'package:focus_cafe_flutter/data/models/user.dart' as FocusCafeUser;
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:focus_cafe_flutter/util/local_storage_manager.dart';

class FirebaseDatasource implements RemoteDatasource {
  late FirebaseFirestore _db = FirebaseFirestore.instance;
  late FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  initializeApp() async {
    print("Firebase.initializeApp() start");
    await Firebase.initializeApp();
    print("Firebase.initializeApp() end");
  }

  @override
  Future<Map<String, dynamic>?> signInAnonymously() async {
    final ret = await _auth.signInAnonymously();
    final firebaseUser = ret.user;
    if (firebaseUser == null) return null;
    Map<String, dynamic> map = Map();
    map[ID_KEY] = firebaseUser.uid;
    return map;
  }

  @override
  Future<Map<String, dynamic>?> getUser(String userId) async {
    DocumentReference doc = _db.collection(USERS_PATH).doc(userId);
    return convertTimestamp((await doc.get()).data() as Map<String, dynamic>?);
  }

  @override
  Future<Map<String, dynamic>?> addUser(Map<String, dynamic> params) async {
    DocumentReference doc = _db.collection(USERS_PATH).doc(params[ID_KEY]);
    DocumentSnapshot snapshot = await doc.get();
    if (!snapshot.exists) {
      //_setCreatedAtParam(params);
      //_setUpdatedAtParam(params);
      await doc.set(params, SetOptions(merge: true));
      snapshot = await doc.get();
    }
    return convertTimestamp(snapshot.data() as Map<String, dynamic>?);
  }

  @override
  Future<Map<String, dynamic>?> updateUser(Map<String, dynamic> params) async {
    DocumentReference doc = _db.collection(USERS_PATH).doc(params[ID_KEY]);
    //_setUpdatedAtParam(params);
    await doc.set(params, SetOptions(merge: true));
    final snapshot = await doc.get();
    return convertTimestamp(snapshot.data() as Map<String, dynamic>?);
  }

  @override
  Future<Done?> getDone(String doneId) async {
    DocumentReference<Done> doc = doneConverter(_db.collection(DONES_PATH).doc(doneId));
    return (await doc.get()).data();
  }

  @override
  Future<Done?> addDone(
    DateTime startDate,
    DateTime endDate,
    int totalElapsedTime,
    FocusCafeUser.User user,
    String body,
    [
      String? questId,
      String? questTitle,
    ]
  ) async {
    final id = getNewFirestoreId();
    Done done = Done.createDoneParams(startDate, endDate, totalElapsedTime, user, body, questId, questTitle);
    done = done.copyWith(id: id);
    DocumentReference<Done> doc = await setWithConverter<Done>(DONES_PATH, id, done, doneConverter);
    return (await doc.get()).data();
  }

  @override
  Future<Done?> editDone(Map<String, dynamic> params) async {
    DocumentReference<Done> doc = doneConverter(await _set(DONES_PATH, params[ID_KEY], params));
    return (await doc.get()).data();
  }

  @override
  Future<List<Done>> getOurDones(DateTime? lastDate, int limit) async {
    return await getModelsWithConverter<Done>(_getOurDonesQuery(lastDate, limit), doneQueryConverter);
  }

  @override
  Future<Map<String, dynamic>?> getActivity(String userId) async {
    DocumentReference doc = _db.collection(ACTIVITYS_PATH).doc(userId);
    return convertTimestamp((await doc.get()).data() as Map<String, dynamic>?);
  }

  @override
  Future<Map<String, dynamic>?> updateActivity(Map<String, dynamic> params) async {
    return convertTimestamp(
        await _setDocument(ACTIVITYS_PATH, params[ID_KEY], params));
  }

  @override
  Future<Map<String, dynamic>?> addRestUser(Map<String, dynamic> params) async {
    return convertTimestamp(
        await _setDocument(REST_USERS_PATH, params[ID_KEY], params));
  }

  @override
  Future<Map<String, dynamic>?> updateRestUser(Map<String, dynamic> params) async {
    return convertTimestamp(
        await _setDocument(REST_USERS_PATH, params[ID_KEY], params));
  }

  @override
  Future<void> deleteRestUser(Map<String, dynamic> params) async {
    return await _deleteDocument(REST_USERS_PATH, params[ID_KEY]);
  }

  @override
  Stream<Map<String, dynamic>> onSnapshotRestUser() {
    // 25分前の時刻
    final DateTime datetime = _getBefore25Minutes();
    final snapshots = _db.collection(REST_USERS_PATH)
        .orderBy("startDate", descending: true)
        .where("startDate", isGreaterThan: datetime)
        .snapshots();
    return _onSnapshot(snapshots);
  }

  @override
  Future<Map<String, dynamic>?> addFocusUser(Map<String, dynamic> params) async {
    return convertTimestamp(
        await _setDocument(FOCUS_USERS_PATH, params[ID_KEY], params));
  }

  @override
  Future<void> deleteFocusUser(Map<String, dynamic> params) async {
    return await _deleteDocument(FOCUS_USERS_PATH, params[ID_KEY]);
  }

  @override
  Stream<Map<String, dynamic>> onSnapshotFocusUser() {
    // 25分前の時刻
    final DateTime datetime = _getBefore25Minutes();
    final snapshots = _db.collection(FOCUS_USERS_PATH)
        .orderBy("startDate", descending: true)
        .where("startDate", isGreaterThan: datetime)
        .snapshots();
    return _onSnapshot(snapshots);
  }

  DateTime _getBefore25Minutes() {
    return DateTime.now().add(Duration(minutes: 25) * -1);
  }

  Stream<Map<String, dynamic>> _onSnapshot(Stream<QuerySnapshot<Map<String, dynamic>>> snapshots) async* {
    await for (final snapshot in snapshots) {
      final changes = snapshot.docChanges;
      for (final change in changes) {
        final data = convertTimestamp(change.doc.data());
        if (data != null) {
          data["updateType"] = HandleEnum.enumToString(change.type);
          print('_onSnapshot updateType=${data["updateType"]} id=${data["id"]}');
          yield data;
        }
      }
    }
  }

  // --- private method ---
  //DocumentReference _getUserRef(uuid) => _db.collection(USERS_PATH).doc(uuid);
  //DocumentReference _getItemRef(uuid) => _db.collection(ITEMS_PATH).doc(uuid);
  //Future<DocumentSnapshot> _getUserDoc(uuid) => getUserRef(uuid).get();
  //Future<DocumentSnapshot> _getItemDoc(itemId) => _getItemRef(itemId).get();

  Future<List<Map<String, dynamic>>> _getJsons(Query q, [bool isConvert = true]) async {
    return (await q.get()).docs.map((doc) =>
      (_getJson(doc.data() as Map<String, dynamic>?, isConvert)) ?? Map())
      .toList();
  }

  Map<String, dynamic>? _getJson(Map<String, dynamic>? json, [bool isConvert = true]) =>
      isConvert ? convertTimestamp(json):json;

  Map<String, dynamic>? convertTimestamp(Map<String, dynamic>? json) {
    if (json == null) return null;
    if (json["startDate"] is Timestamp) {
      json["startDate"] = json["startDate"].toDate().toString();
    }
    if (json["endDate"] is Timestamp) {
      json["endDate"] = json["endDate"].toDate().toString();
    }
    if (json["createdAt"] is Timestamp) {
      json["createdAt"] = json["createdAt"].toDate().toString();
    }
    if (json["updatedAt"] is Timestamp) {
      json["updatedAt"] = json["updatedAt"].toDate().toString();
    }
    if (json["dates"] != null) {
      json["dates"] = json["dates"].map((datetime) => datetime.toDate().toString()).toList();
    }
    return json;
  }

  Map<String, dynamic> _convertDatetimeToTimestamp(Map<String, dynamic> json) {
    if (json["startDate"] is DateTime) {
      json["startDate"] = Timestamp.fromDate(json["startDate"]);
    }
    // Serverで時刻を設定
    if (json["endDate"] is DateTime) {
      json["endDate"] = serverTimestamp();
    }
    return json;
  }

  // FieldValue _serverTimestamp() => FieldValue.serverTimestamp();

  Map<String, dynamic> _setCreatedAtParam(Map<String, dynamic> params) {
    params["createdAt"] = serverTimestamp();
    return params;
  }
  Map<String, dynamic> _setUpdatedAtParam(Map<String, dynamic> params) {
    params["updatedAt"] = serverTimestamp();
    return params;
  }

  Query _getOurDonesQuery(DateTime? lastDate, int limit) {
    Query query = _db.collection(DONES_PATH)
        .orderBy("endDate", descending: true);
    return _getPagingQuery(query, lastDate, limit);
  }

  Query _getPagingQuery(Query q, DateTime? lastDate, int limit) {
    q = lastDate != null ? q.startAfter([Timestamp.fromDate(lastDate)]) : q;
    return q.limit(limit);
  }

  Future<Map<String, dynamic>> _setDoneBasicParams(Map<String, dynamic> params) async {
    final uuid = await LocalStorageManager.getMyUserId();
    if (uuid != null) {
      await _setUserRefParam(params, uuid);
    }
    _convertDatetimeToTimestamp(params);
    return _setBasicParams(params);
  }

  Future<Map<String, dynamic>> _setBasicParams(Map<String, dynamic> params) async {
    _setIdParam(params);
    //_setCreatedAtParam(params);
    //_setUpdatedAtParam(params);
    return params;
  }

  Map<String, dynamic> _setIdParam(Map<String, dynamic> params) {
    params[ID_KEY] = getNewFirestoreId();
    return params;
  }

  Future<Map<String, dynamic>> _setUserRefParam(Map<String, dynamic> params, String uuid, [String paramName = "userRef"]) async {
    params[paramName] = getUserRef(uuid);
    return params;
  }

  Future<Map<String, dynamic>?> _setDocument(String collectionPath, String documentId, Map<String, dynamic> params) async {
    final doc = await _set(collectionPath, documentId, params);
    return (await doc.get()).data() as Map<String, dynamic>?;
  }

  Future<DocumentReference> _set(String collectionPath, String documentId, Map<String, dynamic> params) async {
    DocumentReference doc = _db.collection(collectionPath).doc(documentId);
    await doc.set(params, SetOptions(merge: true));
    return doc;
  }

  Future<void> _deleteDocument(String collectionPath, String documentId) async {
    await _db.collection(collectionPath).doc(documentId).delete();
  }
}