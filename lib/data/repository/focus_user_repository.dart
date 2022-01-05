import 'package:focus_cafe_flutter/data/models/focus_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class FocusUserRepository {
  Future<FocusUser?> addFocusUser(String id, DateTime startDate, User user, int focusTime, int todayCount);
  Future<void> deleteFocusUser(String id);
  Stream<FocusUserRealtime> onSnapshotFocusUser();
}
