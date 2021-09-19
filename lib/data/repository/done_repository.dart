import 'package:focus_cafe_flutter/data/models/done.dart';

abstract class DoneRepository {
  Future<List<Done>> getOurDones(Done? lastItem, int limit);
}
