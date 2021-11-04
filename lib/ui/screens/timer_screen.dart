import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/activity.dart';
import 'package:focus_cafe_flutter/data/models/dones.dart';
import 'package:focus_cafe_flutter/data/models/focus_time.dart';
import 'package:focus_cafe_flutter/data/models/focus.dart' as FCFocus;
import 'package:focus_cafe_flutter/data/models/focus_users.dart';
import 'package:focus_cafe_flutter/data/models/rest_users.dart';
import 'package:focus_cafe_flutter/data/providers/ativity_provider.dart';
import 'package:focus_cafe_flutter/data/providers/dones_provider.dart';
import 'package:focus_cafe_flutter/data/providers/focus_provider.dart';
import 'package:focus_cafe_flutter/data/providers/focus_time_provider.dart';
import 'package:focus_cafe_flutter/data/providers/focus_users_provider.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/data/providers/rest_users_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/activity_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/dones_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_time_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_users_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/rest_users_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/circle_timer.dart';
import 'package:focus_cafe_flutter/ui/widgets/rounge_pane.dart';
import 'package:focus_cafe_flutter/ui/widgets/select_focus_time.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:focus_cafe_flutter/ui/widgets/working_pane.dart';
import 'package:focus_cafe_flutter/util/app_router.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 画面が遷移したあともタイマーは動き続ける
// この画面も解放されない
FocusTime? _focusTime;
FocusTimeNotifier? _focusTimeNotifier;
FCFocus.Focus? _focus;
FocusNotifier? _focusNotifier;
Dones? _dones;
DonesNotifier? _donesNotifier;

class TimerScreen extends HookConsumerWidget {
  late Activity _activity;
  late ActivityNotifier _activityNotifier;
  late RestUsers _restUsers;
  late RestUsersNotifier _restUsersNotifier;
  late FocusUsers _focusUsers;
  late FocusUsersNotifier _focusUsersNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider);
    final _myUserNotifier = ref.read(myUserProvider.notifier);
    _restUsers = ref.watch(restUsersProvider);
    _restUsersNotifier = ref.read(restUsersProvider.notifier);
    _focusUsers = ref.watch(focusUsersProvider);
    _focusUsersNotifier = ref.read(focusUsersProvider.notifier);
    _activity = ref.watch(activityProvider);
    _activityNotifier = ref.read(activityProvider.notifier);
    _dones = ref.watch(donesProvider);
    _donesNotifier = ref.read(donesProvider.notifier);
    _focusTime = ref.watch(focusTimeProvider);
    _focusTimeNotifier = ref.read(focusTimeProvider.notifier);
    _focus = ref.watch(focusProvider);
    _focusNotifier = ref.read(focusProvider.notifier);
    final isFocus = _focus?.isFocus ?? false;

    void startTimer(void Function(int) onTimer) {
      _focusNotifier?.setIsFocus(true);
      _focusNotifier?.setStartDate(DateTime.now());
      _restUsersNotifier.deleteRestUser();
      final focusTime = _focus?.focusTime;
      final now = DateTime.now();
      final todayCount = _activity.dates.where((date) => now.difference(date).inDays == 0 && now.day == date.day).length;
      if (focusTime != null) {
        _focusUsersNotifier.addFocusUser(myUser, focusTime, todayCount + 1);
      }
    }

    void stopTimer(int remainingTime) {
      _focusTimeNotifier?.setRemainingTime(remainingTime);
      _focusNotifier?.setIsFocus(false);
      _focusNotifier?.setStartDate(null);
      _restUsersNotifier.addRestUser(myUser);
      _focusUsersNotifier.deleteFocusUser();
    }

    void onSnapshotUser() async {
      // ここは一回しか実行されないはず
      print("TimerScreen onSnapshotUser");
      _restUsersNotifier.onSnapshotRestUser();
      _focusUsersNotifier.onSnapshotFocusUser();
    }

    useEffect((){
      _myUserNotifier.reload();
      _activityNotifier.reload();
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        // 初期化
        if (_focusTime?.remainingTime == 0) {
          stopTimer(_focus!.focusTime);
        }
      });
      onSnapshotUser();
      return null;
    }, []);

    useEffect((){
      if (myUser.id != null) {
        _focusUsersNotifier.deleteFocusUser();
        _restUsersNotifier.addRestUser(myUser);
      }
    }, [myUser.id]);

    void _onTimer(int remainingTime) {
      print("_onTimer() ${remainingTime}");
      _focusTimeNotifier?.setRemainingTime(remainingTime);
    }

    void _onCompleted() async {
      print("_onCompleted() ${_dones?.items.length}");
      final startDate = _focus?.startDate ?? DateTime.now();
      final focusTime = _focus?.focusTime ?? INIT_FOCUS_TIME_SEC;
      stopTimer(_focus!.focusTime);
      final addPoint = (focusTime / 60).floor();
      _myUserNotifier.updateUserTotalPoint(addPoint == 0 ? 1 : addPoint);
      final done = await _donesNotifier?.addDone(startDate, DateTime.now(), focusTime, myUser, "");
      _activityNotifier.addActivity(DateTime.now());
      Navigator.pushNamed(context, AppRouter.editDoneRoute, arguments: [done]);
    }

    void _onSelectedTime(int value) {
      print("onSelectedTime ${value}");
      _focusTimeNotifier?.setRemainingTime(value);
      _focusNotifier?.setFocusTime(value);
    }

    _onFocusTimer(Timer timer) {
      // TODO
      print("_onFocusTimer()");
    }

    return Center(
      child: Column(
        children: [
          SpaceBox(),
          SelectFocusTime(onChanged: isFocus ? null : _onSelectedTime),
          SpaceBox(),
          CircleTimer(isStart: isFocus, initTime: _focus?.focusTime ?? 0, onTimer: _onTimer, onCompleted: _onCompleted,),
          ElevatedButton(
            child: Text(isFocus ? '中断する':'集中する'),
            onPressed: () {
              isFocus ? stopTimer(_focus!.focusTime):startTimer(_onTimer);
            },
          ),
          SpaceBox(),
          Text("totalPoint=${myUser.totalPoint} activity.dates=${_activity.dates}"),
          SpaceBox(),
          WorkingPane(focusUsers: _focusUsers.items, onTimer: _onFocusTimer),
          SpaceBox(),
          RoungePane(restUsers: _restUsers.items),
        ],
      )
    );
  }
}
