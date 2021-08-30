import 'package:focus_cafe_flutter/data/models/app_state_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
abstract class AppState with _$AppState{
  const factory AppState({
    @Default(AppStateType.init) AppStateType stateType,
    @Default(0) int selectedTabIndex,
  }) = _AppState;
  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
