import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/activity_converter.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/common_util.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/done_converter.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/focus_user_converter.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/rest_user_converter.dart';
import 'package:focus_cafe_flutter/data/converter/firestore/user_converter.dart';
import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/activity.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/focus_user.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart' as FocusCafeUser;
import 'package:focus_cafe_flutter/util/constants.dart';

class FirebaseDatasource implements RemoteDatasource {
  late FirebaseFirestore _db = FirebaseFirestore.instance;
  late FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  initializeApp() async {
    await Firebase.initializeApp();
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
    final done = Done.createDoneParams(id, startDate, endDate, totalElapsedTime, user, body, questId, questTitle);
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
  Future<RestUser?> updateRestUser(Map<String, dynamic> params) async {
    DocumentReference<RestUser> doc = restUserConverter(await _set(REST_USERS_PATH, params[ID_KEY], params));
    return (await doc.get()).data();
  }

  @override
  Future<void> deleteRestUser(Map<String, dynamic> params) async {
    return await _deleteDocument(REST_USERS_PATH, params[ID_KEY]);
  }

  @override
  Stream<RestUserRealtime> onSnapshotRestUser() {
    // 25分前の時刻
    final DateTime datetime = _getBefore25Minutes();
    final query = restUserQueryConverter(
          _db.collection(REST_USERS_PATH)
          .orderBy("startDate", descending: true)
          .where("startDate", isGreaterThan: datetime)
        );
    return onRealtimeUpdate<RestUser, RestUserRealtime>(query.snapshots(), (model) => new RestUserRealtime(restUser: model));
  }

  // ここから
  @override
  Future<FocusUser?> addFocusUser(String id, DateTime startDate, FocusCafeUser.User user, int focusTime, int todayCount) async {
    final focusUser = FocusUser.createFocusUserParams(id, startDate, user, focusTime, todayCount);
    DocumentReference<FocusUser> doc = await setWithConverter<FocusUser>(FOCUS_USERS_PATH, id, focusUser, focusUserConverter);
    return (await doc.get()).data();
  }

  @override
  Future<void> deleteFocusUser(String userId) async {
    return await _deleteDocument(FOCUS_USERS_PATH, userId);
  }

  @override
  Stream<FocusUserRealtime> onSnapshotFocusUser() {
    // 25分前の時刻
    final DateTime datetime = _getBefore25Minutes();
    final query = focusUserQueryConverter(
        _db.collection(FOCUS_USERS_PATH)
            .orderBy("startDate", descending: true)
            .where("startDate", isGreaterThan: datetime)
    );
    return onRealtimeUpdate<FocusUser, FocusUserRealtime>(query.snapshots(), (model) => new FocusUserRealtime(focusUser: model));
  }

  DateTime _getBefore25Minutes() {
    return DateTime.now().add(Duration(minutes: 25) * -1);
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

  Future<DocumentReference> _set(String collectionPath, String documentId, Map<String, dynamic> params) async {
    DocumentReference doc = _db.collection(collectionPath).doc(documentId);
    await doc.set(params, SetOptions(merge: true));
    return doc;
  }

  Future<void> _deleteDocument(String collectionPath, String documentId) async {
    await _db.collection(collectionPath).doc(documentId).delete();
  }
}