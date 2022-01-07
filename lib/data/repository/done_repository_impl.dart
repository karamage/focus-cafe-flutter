import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/done_repository.dart';

class DoneRepositoryImpl implements DoneRepository {
  final RemoteDatasource _ds;
  DoneRepositoryImpl({required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<Done?> getDone(String doneId) async {
    return await _ds.getDone(doneId);
  }

  @override
  Future<List<Done>> getOurDones(Done? lastItem, int limit) async {
    return await _ds.getOurDones(lastItem?.endDate, limit);
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
    return await _ds.addDone(startDate, endDate, totalElapsedTime, user, body, questId, questTitle);
  }

  @override
  Future<Done?> editDoneBody(String id, String body) async {
    final params = Done.createEditBodyParams(id, body);
    return await _ds.editDone(params);
  }

  @override
  Future<Done?> addLike(String id, User myUser) async {
    final preDone = await _ds.getDone(id);
    if (preDone != null) {
      final likeCount = (preDone.likeCount ?? 0) + 1;
      final List<String?> likedUserIds = [...(preDone.likedUserIds ?? [])]..add(myUser.id);
      final List<String?> likedUserNames = [...(preDone.likedUserNames ?? [])]..add(myUser.name);
      final List<String?> likedUserPhotoUrls = [...(preDone.likedUserPhotoUrls ?? [])]..add(myUser.photoUrl);
      final params = Done.createAddLikeParams(id, likeCount, likedUserIds, likedUserNames, likedUserPhotoUrls);
      return await _ds.editDone(params);
    } else {
      return null;
    }
  }
}