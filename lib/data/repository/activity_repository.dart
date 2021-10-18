import 'package:focus_cafe_flutter/data/models/activity.dart';

abstract class ActivityRepository {
  Future<Activity?> getActivity(String id);
  Future<Activity?> updateActivity(String id, List<DateTime> dates);
}
