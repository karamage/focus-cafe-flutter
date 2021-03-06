import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/activity.dart';
import 'package:focus_cafe_flutter/data/repository/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final RemoteDatasource _ds;
  ActivityRepositoryImpl({required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<Activity?> getActivity(String id) async {
    return await _ds.getActivity(id);
  }

  @override
  Future<Activity?> updateActivity(String id, List<DateTime> dates) async {
    final params = Activity.createActivityParams(id, dates);
    return await _ds.updateActivity(params);
  }
}
