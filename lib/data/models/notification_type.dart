import 'package:freezed_annotation/freezed_annotation.dart';

enum NotificationType {
  @JsonValue('like')
  like,

  @JsonValue('comment')
  comment,

  @JsonValue('system')
  system,
}

