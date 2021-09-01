import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';

class FirebaseDatasource implements RemoteDatasource {
  /* ここはinitializeApp読んだあとに遅らせる必要あり lateinit だっけ
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
   */

  @override
  initializeApp() async {
    await Firebase.initializeApp();
  }
}