import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/done_repository.dart';

class DoneRepositoryImpl implements DoneRepository {
  final RemoteDatasource _ds;
  DoneRepositoryImpl({required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<List<Done>> getOurDones(Done? lastItem, int limit) async {
    final jsons = await _ds.getOurDones(lastItem?.endDate, limit);
    return jsons.map((json) => Done.fromJson(json)).toList();
  }

  @override
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
  ) async {
    final params = Done.createParams(startDate, endDate, totalElapsedTime, user, body, questId, questTitle);
    final json = await _ds.addDone(params);
    return json != null ? Done.fromJson(json):null;
  }
}