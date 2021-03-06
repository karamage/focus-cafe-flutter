// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'done.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Done _$_$_DoneFromJson(Map<String, dynamic> json) {
  return _$_Done(
    id: json['id'] as String? ?? '',
    startDate:
        const DatetimeConverter().fromJson(json['startDate'] as Timestamp?),
    endDate: const DatetimeConverter().fromJson(json['endDate'] as Timestamp?),
    totalElapsedTime: json['totalElapsedTime'] as int? ?? 0,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    body: json['body'] as String? ?? '',
    likeCount: json['likeCount'] as int?,
    likedUserIds: (json['likedUserIds'] as List<dynamic>?)
            ?.map((e) => e as String?)
            .toList() ??
        [],
    likedUserNames: (json['likedUserNames'] as List<dynamic>?)
            ?.map((e) => e as String?)
            .toList() ??
        [],
    likedUserPhotoUrls: (json['likedUserPhotoUrls'] as List<dynamic>?)
            ?.map((e) => e as String?)
            .toList() ??
        [],
    photoUrl: json['photoUrl'] as String?,
    commentCount: json['commentCount'] as int?,
    isCommentForm: json['isCommentForm'] as bool? ?? false,
    questId: json['questId'] as String?,
    questTitle: json['questTitle'] as String?,
  );
}

Map<String, dynamic> _$_$_DoneToJson(_$_Done instance) => <String, dynamic>{
      'id': instance.id,
      'startDate': const DatetimeConverter().toJson(instance.startDate),
      'endDate': const DatetimeConverter().toJson(instance.endDate),
      'totalElapsedTime': instance.totalElapsedTime,
      'user': instance.user,
      'body': instance.body,
      'likeCount': instance.likeCount,
      'likedUserIds': instance.likedUserIds,
      'likedUserNames': instance.likedUserNames,
      'likedUserPhotoUrls': instance.likedUserPhotoUrls,
      'photoUrl': instance.photoUrl,
      'commentCount': instance.commentCount,
      'isCommentForm': instance.isCommentForm,
      'questId': instance.questId,
      'questTitle': instance.questTitle,
    };
