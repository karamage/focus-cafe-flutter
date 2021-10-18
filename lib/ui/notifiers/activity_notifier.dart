import 'package:focus_cafe_flutter/data/models/activity.dart';
import 'package:focus_cafe_flutter/data/repository/activity_repository.dart';
import 'package:focus_cafe_flutter/util/local_storage_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActivityNotifier extends StateNotifier<Activity> {
  ActivityNotifier({required ActivityRepository repository})
      : _repository = repository,
        super(const Activity()) {}
  final ActivityRepository _repository;

  Future<void> reload() async {
    final myUserId = await LocalStorageManager.getMyUserId();
    if (myUserId != null) {
      final activity = await _repository.getActivity(myUserId);
      print("ActivityNotifier reload() activity.dates = ${activity?.dates}");
      if (activity != null) state = activity;
    }
  }

  // activityに日付を追加する
  Future<Activity?> addActivity(DateTime addDate) async {
    final myUserId = await LocalStorageManager.getMyUserId();
    if (myUserId == null) return null;
    final preActivity = await _repository.getActivity(myUserId);
    final dates = preActivity?.dates ?? [];
    dates.add(addDate);
    final activity = await _repository.updateActivity(myUserId, dates);
    if (activity != null) {
      state = activity;
      return state.copyWith();
    }
    return null;
  }

}
