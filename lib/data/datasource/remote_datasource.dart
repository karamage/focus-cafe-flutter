import 'package:focus_cafe_flutter/data/models/activity.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class RemoteDatasource {
  initializeApp();
  Future<Map<String, dynamic>?> signInAnonymously();
  Future<Map<String, dynamic>?> getUser(String userId);
  Future<Map<String, dynamic>?> addUser(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> updateUser(Map<String, dynamic> params);
  Future<List<Done>> getOurDones(DateTime? lastDate, int limit);
  Future<Done?> getDone(String doneId);
  Future<Done?> addDone(
    DateTime startDate,
    DateTime endDate,
    int totalElapsedTime,
    User user,
    String body,
    [
      String? questId,
      String? questTitle,
    ]
  );
  Future<Done?> editDone(Map<String, dynamic> params);
  Future<Activity?> getActivity(String userId);
  Future<Activity?> updateActivity(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> addRestUser(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> updateRestUser(Map<String, dynamic> params);
  Future<void> deleteRestUser(Map<String, dynamic> params);
  Stream<Map<String, dynamic>> onSnapshotRestUser();
  Future<Map<String, dynamic>?> addFocusUser(Map<String, dynamic> params);
  Future<void> deleteFocusUser(Map<String, dynamic> params);
  Stream<Map<String, dynamic>> onSnapshotFocusUser();
}
