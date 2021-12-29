import 'package:focus_cafe_flutter/data/models/realtime_update_type.dart';

class HandleEnum {
  // Enumの値を文字列として扱えるようにする
  static enumToString(value) {
    if (value == null) {
      return "none";
    }
    return value.toString().split('.')[1];
  }

  static RealtimeUpdateType convertRealtimeUpdateType(String str) {
    return RealtimeUpdateType.values.firstWhere((item) {
      return enumToString(item) == str;
    }, orElse: () => RealtimeUpdateType.modified);
  }
  /*
  static CategoryType convertCategory(String str) {
    return CategoryType.values.firstWhere((item) {
      return enumToString(item) == str;
    }, orElse: () => CategoryType.none);
  }
  */
}
