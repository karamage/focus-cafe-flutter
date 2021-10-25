import 'package:freezed_annotation/freezed_annotation.dart';

enum RealtimeUpdateType {
  @JsonValue('added')
  added,

  @JsonValue('modified')
  modified,

  @JsonValue('removed')
  removed,
}

