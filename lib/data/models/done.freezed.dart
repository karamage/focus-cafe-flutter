// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'done.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Done _$DoneFromJson(Map<String, dynamic> json) {
  return _Done.fromJson(json);
}

/// @nodoc
class _$DoneTearOff {
  const _$DoneTearOff();

  _Done call(
      {String id = "",
      @DatetimeConverter() DateTime? startDate,
      @DatetimeConverter() DateTime? endDate,
      int totalElapsedTime = 0,
      User? user,
      String body = "",
      int? likeCount = null,
      List<String?>? likedUserIds = const [],
      List<String?>? likedUserNames = const [],
      List<String?>? likedUserPhotoUrls = const [],
      String? photoUrl = null,
      int? commentCount = null,
      bool isCommentForm = false,
      String? questId = null,
      String? questTitle = null}) {
    return _Done(
      id: id,
      startDate: startDate,
      endDate: endDate,
      totalElapsedTime: totalElapsedTime,
      user: user,
      body: body,
      likeCount: likeCount,
      likedUserIds: likedUserIds,
      likedUserNames: likedUserNames,
      likedUserPhotoUrls: likedUserPhotoUrls,
      photoUrl: photoUrl,
      commentCount: commentCount,
      isCommentForm: isCommentForm,
      questId: questId,
      questTitle: questTitle,
    );
  }

  Done fromJson(Map<String, Object> json) {
    return Done.fromJson(json);
  }
}

/// @nodoc
const $Done = _$DoneTearOff();

/// @nodoc
mixin _$Done {
  String get id => throw _privateConstructorUsedError;
  @DatetimeConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @DatetimeConverter()
  DateTime? get endDate => throw _privateConstructorUsedError;
  int get totalElapsedTime => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  int? get likeCount => throw _privateConstructorUsedError;
  List<String?>? get likedUserIds => throw _privateConstructorUsedError;
  List<String?>? get likedUserNames => throw _privateConstructorUsedError;
  List<String?>? get likedUserPhotoUrls => throw _privateConstructorUsedError;
  String? get photoUrl =>
      throw _privateConstructorUsedError; //Comment? latestComment,
  int? get commentCount => throw _privateConstructorUsedError;
  bool get isCommentForm => throw _privateConstructorUsedError;
  String? get questId => throw _privateConstructorUsedError;
  String? get questTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoneCopyWith<Done> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoneCopyWith<$Res> {
  factory $DoneCopyWith(Done value, $Res Function(Done) then) =
      _$DoneCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @DatetimeConverter() DateTime? startDate,
      @DatetimeConverter() DateTime? endDate,
      int totalElapsedTime,
      User? user,
      String body,
      int? likeCount,
      List<String?>? likedUserIds,
      List<String?>? likedUserNames,
      List<String?>? likedUserPhotoUrls,
      String? photoUrl,
      int? commentCount,
      bool isCommentForm,
      String? questId,
      String? questTitle});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$DoneCopyWithImpl<$Res> implements $DoneCopyWith<$Res> {
  _$DoneCopyWithImpl(this._value, this._then);

  final Done _value;
  // ignore: unused_field
  final $Res Function(Done) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? totalElapsedTime = freezed,
    Object? user = freezed,
    Object? body = freezed,
    Object? likeCount = freezed,
    Object? likedUserIds = freezed,
    Object? likedUserNames = freezed,
    Object? likedUserPhotoUrls = freezed,
    Object? photoUrl = freezed,
    Object? commentCount = freezed,
    Object? isCommentForm = freezed,
    Object? questId = freezed,
    Object? questTitle = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalElapsedTime: totalElapsedTime == freezed
          ? _value.totalElapsedTime
          : totalElapsedTime // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likedUserIds: likedUserIds == freezed
          ? _value.likedUserIds
          : likedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      likedUserNames: likedUserNames == freezed
          ? _value.likedUserNames
          : likedUserNames // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      likedUserPhotoUrls: likedUserPhotoUrls == freezed
          ? _value.likedUserPhotoUrls
          : likedUserPhotoUrls // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isCommentForm: isCommentForm == freezed
          ? _value.isCommentForm
          : isCommentForm // ignore: cast_nullable_to_non_nullable
              as bool,
      questId: questId == freezed
          ? _value.questId
          : questId // ignore: cast_nullable_to_non_nullable
              as String?,
      questTitle: questTitle == freezed
          ? _value.questTitle
          : questTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$DoneCopyWith<$Res> implements $DoneCopyWith<$Res> {
  factory _$DoneCopyWith(_Done value, $Res Function(_Done) then) =
      __$DoneCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @DatetimeConverter() DateTime? startDate,
      @DatetimeConverter() DateTime? endDate,
      int totalElapsedTime,
      User? user,
      String body,
      int? likeCount,
      List<String?>? likedUserIds,
      List<String?>? likedUserNames,
      List<String?>? likedUserPhotoUrls,
      String? photoUrl,
      int? commentCount,
      bool isCommentForm,
      String? questId,
      String? questTitle});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$DoneCopyWithImpl<$Res> extends _$DoneCopyWithImpl<$Res>
    implements _$DoneCopyWith<$Res> {
  __$DoneCopyWithImpl(_Done _value, $Res Function(_Done) _then)
      : super(_value, (v) => _then(v as _Done));

  @override
  _Done get _value => super._value as _Done;

  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? totalElapsedTime = freezed,
    Object? user = freezed,
    Object? body = freezed,
    Object? likeCount = freezed,
    Object? likedUserIds = freezed,
    Object? likedUserNames = freezed,
    Object? likedUserPhotoUrls = freezed,
    Object? photoUrl = freezed,
    Object? commentCount = freezed,
    Object? isCommentForm = freezed,
    Object? questId = freezed,
    Object? questTitle = freezed,
  }) {
    return _then(_Done(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalElapsedTime: totalElapsedTime == freezed
          ? _value.totalElapsedTime
          : totalElapsedTime // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likedUserIds: likedUserIds == freezed
          ? _value.likedUserIds
          : likedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      likedUserNames: likedUserNames == freezed
          ? _value.likedUserNames
          : likedUserNames // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      likedUserPhotoUrls: likedUserPhotoUrls == freezed
          ? _value.likedUserPhotoUrls
          : likedUserPhotoUrls // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isCommentForm: isCommentForm == freezed
          ? _value.isCommentForm
          : isCommentForm // ignore: cast_nullable_to_non_nullable
              as bool,
      questId: questId == freezed
          ? _value.questId
          : questId // ignore: cast_nullable_to_non_nullable
              as String?,
      questTitle: questTitle == freezed
          ? _value.questTitle
          : questTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Done implements _Done {
  const _$_Done(
      {this.id = "",
      @DatetimeConverter() this.startDate,
      @DatetimeConverter() this.endDate,
      this.totalElapsedTime = 0,
      this.user,
      this.body = "",
      this.likeCount = null,
      this.likedUserIds = const [],
      this.likedUserNames = const [],
      this.likedUserPhotoUrls = const [],
      this.photoUrl = null,
      this.commentCount = null,
      this.isCommentForm = false,
      this.questId = null,
      this.questTitle = null});

  factory _$_Done.fromJson(Map<String, dynamic> json) =>
      _$_$_DoneFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String id;
  @override
  @DatetimeConverter()
  final DateTime? startDate;
  @override
  @DatetimeConverter()
  final DateTime? endDate;
  @JsonKey(defaultValue: 0)
  @override
  final int totalElapsedTime;
  @override
  final User? user;
  @JsonKey(defaultValue: "")
  @override
  final String body;
  @JsonKey(defaultValue: null)
  @override
  final int? likeCount;
  @JsonKey(defaultValue: const [])
  @override
  final List<String?>? likedUserIds;
  @JsonKey(defaultValue: const [])
  @override
  final List<String?>? likedUserNames;
  @JsonKey(defaultValue: const [])
  @override
  final List<String?>? likedUserPhotoUrls;
  @JsonKey(defaultValue: null)
  @override
  final String? photoUrl;
  @JsonKey(defaultValue: null)
  @override //Comment? latestComment,
  final int? commentCount;
  @JsonKey(defaultValue: false)
  @override
  final bool isCommentForm;
  @JsonKey(defaultValue: null)
  @override
  final String? questId;
  @JsonKey(defaultValue: null)
  @override
  final String? questTitle;

  @override
  String toString() {
    return 'Done(id: $id, startDate: $startDate, endDate: $endDate, totalElapsedTime: $totalElapsedTime, user: $user, body: $body, likeCount: $likeCount, likedUserIds: $likedUserIds, likedUserNames: $likedUserNames, likedUserPhotoUrls: $likedUserPhotoUrls, photoUrl: $photoUrl, commentCount: $commentCount, isCommentForm: $isCommentForm, questId: $questId, questTitle: $questTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Done &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.totalElapsedTime, totalElapsedTime) ||
                const DeepCollectionEquality()
                    .equals(other.totalElapsedTime, totalElapsedTime)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.likeCount, likeCount) ||
                const DeepCollectionEquality()
                    .equals(other.likeCount, likeCount)) &&
            (identical(other.likedUserIds, likedUserIds) ||
                const DeepCollectionEquality()
                    .equals(other.likedUserIds, likedUserIds)) &&
            (identical(other.likedUserNames, likedUserNames) ||
                const DeepCollectionEquality()
                    .equals(other.likedUserNames, likedUserNames)) &&
            (identical(other.likedUserPhotoUrls, likedUserPhotoUrls) ||
                const DeepCollectionEquality()
                    .equals(other.likedUserPhotoUrls, likedUserPhotoUrls)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.commentCount, commentCount) ||
                const DeepCollectionEquality()
                    .equals(other.commentCount, commentCount)) &&
            (identical(other.isCommentForm, isCommentForm) ||
                const DeepCollectionEquality()
                    .equals(other.isCommentForm, isCommentForm)) &&
            (identical(other.questId, questId) ||
                const DeepCollectionEquality()
                    .equals(other.questId, questId)) &&
            (identical(other.questTitle, questTitle) ||
                const DeepCollectionEquality()
                    .equals(other.questTitle, questTitle)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(totalElapsedTime) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(likeCount) ^
      const DeepCollectionEquality().hash(likedUserIds) ^
      const DeepCollectionEquality().hash(likedUserNames) ^
      const DeepCollectionEquality().hash(likedUserPhotoUrls) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(commentCount) ^
      const DeepCollectionEquality().hash(isCommentForm) ^
      const DeepCollectionEquality().hash(questId) ^
      const DeepCollectionEquality().hash(questTitle);

  @JsonKey(ignore: true)
  @override
  _$DoneCopyWith<_Done> get copyWith =>
      __$DoneCopyWithImpl<_Done>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DoneToJson(this);
  }
}

abstract class _Done implements Done {
  const factory _Done(
      {String id,
      @DatetimeConverter() DateTime? startDate,
      @DatetimeConverter() DateTime? endDate,
      int totalElapsedTime,
      User? user,
      String body,
      int? likeCount,
      List<String?>? likedUserIds,
      List<String?>? likedUserNames,
      List<String?>? likedUserPhotoUrls,
      String? photoUrl,
      int? commentCount,
      bool isCommentForm,
      String? questId,
      String? questTitle}) = _$_Done;

  factory _Done.fromJson(Map<String, dynamic> json) = _$_Done.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @DatetimeConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @override
  @DatetimeConverter()
  DateTime? get endDate => throw _privateConstructorUsedError;
  @override
  int get totalElapsedTime => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  String get body => throw _privateConstructorUsedError;
  @override
  int? get likeCount => throw _privateConstructorUsedError;
  @override
  List<String?>? get likedUserIds => throw _privateConstructorUsedError;
  @override
  List<String?>? get likedUserNames => throw _privateConstructorUsedError;
  @override
  List<String?>? get likedUserPhotoUrls => throw _privateConstructorUsedError;
  @override
  String? get photoUrl => throw _privateConstructorUsedError;
  @override //Comment? latestComment,
  int? get commentCount => throw _privateConstructorUsedError;
  @override
  bool get isCommentForm => throw _privateConstructorUsedError;
  @override
  String? get questId => throw _privateConstructorUsedError;
  @override
  String? get questTitle => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DoneCopyWith<_Done> get copyWith => throw _privateConstructorUsedError;
}
