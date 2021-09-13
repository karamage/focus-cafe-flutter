import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/util/constants.dart';

const USERS_PATH = "users";

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
      _setCreatedAtParam(params);
      _setUpdatedAtParam(params);
      await doc.set(params, SetOptions(merge: true));
      snapshot = await doc.get();
    }
    return convertTimestamp(snapshot.data() as Map<String, dynamic>?);
  }

  Map<String, dynamic>? convertTimestamp(Map<String, dynamic>? json) {
    if (json == null) return null;
    if (json["createdAt"] is Timestamp) {
      json["createdAt"] = json["createdAt"].toDate().toString();
    }
    if (json["updatedAt"] is Timestamp) {
      json["updatedAt"] = json["updatedAt"].toDate().toString();
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

}