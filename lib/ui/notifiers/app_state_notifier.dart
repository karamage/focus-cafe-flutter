import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/app_state.dart';
import 'package:focus_cafe_flutter/data/models/app_state_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier({required RemoteDatasource ds}) : _ds = ds, super(const AppState(stateType: AppStateType.init)) {}

  final RemoteDatasource _ds;

  Future<void> initApp() async {
    await _ds.initializeApp();
    state = state.copyWith(stateType: AppStateType.initCompleted);
  }

  Future<void> setAppStateType(AppStateType stateType) async {
    state = state.copyWith(stateType: stateType);
  }

  setSelectedTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }
}
