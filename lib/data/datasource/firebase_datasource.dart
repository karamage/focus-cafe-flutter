import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/realtime_update_type.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:focus_cafe_flutter/util/local_storage_manager.dart';

const USERS_PATH = "users";
const DONES_PATH = "dones";
const ACTIVITYS_PATH = "activitys";
const REST_USERS_PATH = "restUsers";

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
  Future<Map<String, dynamic>?> addDone(Map<String, dynamic> params) async {
    params = await _setDoneBasicParams(params);
    return convertTimestamp(
        await _setDocument(DONES_PATH, params[ID_KEY], params));
  }

  @override
  Future<Map<String, dynamic>?> editDone(Map<String, dynamic> params) async {
    return convertTimestamp(
        await _setDocument(DONES_PATH, params[ID_KEY], params));
  }

  @override
  Future<List<Map<String, dynamic>>> getOurDones(DateTime? lastDate, int limit) async {
    return await _getJsons(_getOurDonesQuery(lastDate, limit));
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
  Stream<Map<String, dynamic>> onSnapshotRestUser() {
    // 25分前の時刻
    final now = DateTime.now();
    final DateTime datetime = now.add(Duration(minutes: 25) * -1);
    final snapshots = _db.collection(REST_USERS_PATH)
        .orderBy("startDate", descending: true)
        .where("startDate", isGreaterThan: datetime)
        .snapshots();
    return _onSnapshot(snapshots);
  }

  Stream<Map<String, dynamic>> _onSnapshot(Stream<QuerySnapshot<Map<String, dynamic>>> snapshots) async* {
    await for (final snapshot in snapshots) {
      final changes = snapshot.docChanges;
      for (final change in changes) {
        final data = convertTimestamp(change.doc.data());
        if (data != null) {
          data["changeType"] = _getRealtimeUpdateType(change.type);
          yield data;
        }
      }
    }
  }

  RealtimeUpdateType _getRealtimeUpdateType(DocumentChangeType type) {
    switch (type) {
      case DocumentChangeType.added:
        return RealtimeUpdateType.added;
      case DocumentChangeType.modified:
        return RealtimeUpdateType.modified;
      case DocumentChangeType.removed:
        return RealtimeUpdateType.removed;
      default:
        return RealtimeUpdateType.added;
    }
  }

  // --- private method ---
  DocumentReference _getUserRef(uuid) => _db.collection(USERS_PATH).doc(uuid);
  //DocumentReference _getItemRef(uuid) => _db.collection(ITEMS_PATH).doc(uuid);
  Future<DocumentSnapshot> _getUserDoc(uuid) => _getUserRef(uuid).get();
  //Future<DocumentSnapshot> _getItemDoc(itemId) => _getItemRef(itemId).get();

  Future<List<Map<String, dynamic>>> _getJsons(Query q) async {
    return (await q.get()).docs.map((doc) =>
      (_getJson(doc.data() as Map<String, dynamic>?)) ?? Map())
      .toList();
  }

  Map<String, dynamic>? _getJson(Map<String, dynamic>? json) =>
      convertTimestamp(json);

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
      json["endDate"] = _serverTimestamp();
    }
    return json;
  }

  FieldValue _serverTimestamp() => FieldValue.serverTimestamp();
  Map<String, dynamic> _setCreatedAtParam(Map<String, dynamic> params) {
    params["createdAt"] = _serverTimestamp();
    return params;
  }
  Map<String, dynamic> _setUpdatedAtParam(Map<String, dynamic> params) {
    params["updatedAt"] = _serverTimestamp();
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
    params[ID_KEY] = _getNewFirestoreId();
    return params;
  }

  Future<Map<String, dynamic>> _setUserRefParam(Map<String, dynamic> params, String uuid, [String paramName = "userRef"]) async {
    params[paramName] = _getUserRef(uuid);
    return params;
  }

  String _getNewFirestoreId() => _db.collection('_').doc().id;

  Future<Map<String, dynamic>?> _setDocument(String collectionPath, String documentId, Map<String, dynamic> params) async {
    DocumentReference doc = _db.collection(collectionPath).doc(documentId);
    await doc.set(params, SetOptions(merge: true));
    return (await doc.get()).data() as Map<String, dynamic>?;
  }

}