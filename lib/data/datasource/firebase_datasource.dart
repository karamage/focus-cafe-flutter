import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/activity_converter.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/common_util.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/done_converter.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/rest_user_converter.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/user_converter.dart';
import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/activity.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/handle_enum.dart';
import 'package:focus_cafe_flutter/data/models/realtime_update_type.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
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
    return {
      ID_KEY: firebaseUser.uid
    };
  }

  @override
  Future<FocusCafeUser.User?> getUser(String userId) async {
    DocumentReference<FocusCafeUser.User> doc = userConverter(_db.collection(USERS_PATH).doc(userId));
    return (await doc.get()).data();
  }

  @override
  Future<FocusCafeUser.User?> addUser(String id, String nickname, String desc, bool isAnonymouse) async {
    FocusCafeUser.User? user = await getUser(id);
    if (user == null) {
      user = FocusCafeUser.User.createUserParams(id: id, name: nickname, desc: desc, isAnonymous: isAnonymouse);
      DocumentReference<FocusCafeUser.User> doc = await setWithConverter<FocusCafeUser.User>(USERS_PATH, id, user, userConverter);
      user = (await doc.get()).data();
    }
    return user;
  }

  @override
  Future<FocusCafeUser.User?> updateUser(Map<String, dynamic> params) async {
    DocumentReference<FocusCafeUser.User> doc = userConverter(await _set(USERS_PATH, params[ID_KEY], params));
    return (await doc.get()).data();
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
  Future<Activity?> getActivity(String userId) async {
    DocumentReference<Activity> doc = activityConverter(_db.collection(ACTIVITYS_PATH).doc(userId));
    return (await doc.get()).data();
  }

  @override
  Future<Activity?> updateActivity(Map<String, dynamic> params) async {
    DocumentReference<Activity> doc = activityConverter(await _set(ACTIVITYS_PATH, params[ID_KEY], params));
    return (await doc.get()).data();
  }

  @override
  Future<RestUser?> addRestUser(String id, DateTime startDate, FocusCafeUser.User user) async {
    final restUser = RestUser.createRestUserParams(id, startDate, user);
    DocumentReference<RestUser> doc = await setWithConverter<RestUser>(REST_USERS_PATH, id, restUser, restUserConverter);
    return (await doc.get()).data();
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
  Stream<RestUser> onSnapshotRestUser() async* {
    // 25分前の時刻
    final DateTime datetime = _getBefore25Minutes();
    final query = restUserQueryConverter(
          _db.collection(REST_USERS_PATH)
          .orderBy("startDate", descending: true)
          .where("startDate", isGreaterThan: datetime)
        );
    final changes = _onDocumentChange(query.snapshots());
    await for (final change in changes) {
      final data = change.doc.data();
      if (data != null) {
        RealtimeUpdateType updateType = HandleEnum.convertRealtimeUpdateType(HandleEnum.enumToString(change.type));
        yield data.copyWith(updateType: updateType);
      }
    }
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

  Stream<DocumentChange<T>> _onDocumentChange<T>(Stream<QuerySnapshot<T>> snapshots) async* {
    await for (final snapshot in snapshots) {
      final changes = snapshot.docChanges;
      for (final change in changes) {
        yield change;
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