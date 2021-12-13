import 'package:focus_cafe_flutter/data/models/done.dart';

abstract class RemoteDatasource {
  initializeApp();
  Future<Map<String, dynamic>?> signInAnonymously();
  Future<Map<String, dynamic>?> getUser(String userId);
  Future<Map<String, dynamic>?> addUser(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> updateUser(Map<String, dynamic> params);
  Future<List<Map<String, dynamic>>> getOurDones(DateTime? lastDate, int limit);
  Future<Done?> getDone(String doneId);
  Future<Map<String, dynamic>?> addDone(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> editDone(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> getActivity(String userId);
  Future<Map<String, dynamic>?> updateActivity(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> addRestUser(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> updateRestUser(Map<String, dynamic> params);
  Future<void> deleteRestUser(Map<String, dynamic> params);
  Stream<Map<String, dynamic>> onSnapshotRestUser();
  Future<Map<String, dynamic>?> addFocusUser(Map<String, dynamic> params);
  Future<void> deleteFocusUser(Map<String, dynamic> params);
  Stream<Map<String, dynamic>> onSnapshotFocusUser();
}
