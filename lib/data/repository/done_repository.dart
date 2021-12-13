import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class DoneRepository {
  Future<Done?> getDone(String doneId);
  Future<List<Done>> getOurDones(Done? lastItem, int limit);
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

  Future<Done?> editDoneBody(String id, String body);
}
