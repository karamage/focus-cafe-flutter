import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/activity.dart';
import 'package:focus_cafe_flutter/data/models/dones.dart';
import 'package:focus_cafe_flutter/data/models/focus_time.dart';
import 'package:focus_cafe_flutter/data/models/focus.dart' as FCFocus;
import 'package:focus_cafe_flutter/data/models/rest_users.dart';
import 'package:focus_cafe_flutter/data/providers/ativity_provider.dart';
import 'package:focus_cafe_flutter/data/providers/dones_provider.dart';
import 'package:focus_cafe_flutter/data/providers/focus_provider.dart';
import 'package:focus_cafe_flutter/data/providers/focus_time_provider.dart';
import 'package:focus_cafe_flutter/data/providers/focus_users_provider.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/data/providers/rest_time_provider.dart';
import 'package:focus_cafe_flutter/data/providers/rest_users_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/activity_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/dones_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_time_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_users_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/rest_time_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/rest_users_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/cafeterace_pane.dart';
import 'package:focus_cafe_flutter/ui/widgets/circle_timer.dart';
import 'package:focus_cafe_flutter/ui/widgets/rounge_pane.dart';
import 'package:focus_cafe_flutter/ui/widgets/select_focus_time.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:focus_cafe_flutter/ui/widgets/working_pane.dart';
import 'package:focus_cafe_flutter/util/app_router.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:focus_cafe_flutter/util/sound_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';

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
  late RestTimeNotifier _restTimeNotifier;
  late FocusUsersNotifier _focusUsersNotifier;

  bool isSound = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider);
    final _myUserNotifier = ref.read(myUserProvider.notifier);
    _restUsers = ref.watch(restUsersProvider);
    _restUsersNotifier = ref.read(restUsersProvider.notifier);
    _restTimeNotifier = ref.read(restTimeProvider.notifier);
    final roungeUsers = _restUsers.items.where((user) => user.chairId == null).toList();
    final cafeteraceUsers = _restUsers.items.where((user) => user.chairId != null).toList();
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
      isSound = false;
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
      isSound = false;
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
      SoundUtil.initLoad();
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

      // 完了6秒前くらいに音を鳴らす
      if (!isSound && remainingTime <= 6) {
        isSound = true;
        SoundUtil.playZihou();
      }
    }

    // 空き席の自動選択
    int _selectChairId() {
      int selectedId = -1;
      int firstId = -1;
      cafeTables.forEach((table) {
        final chairs = table["chairs"]! as List<Map<String, Object>>;
        chairs.forEach((chair) {
          final chairId = chair["id"] as int;
          if (firstId == -1) firstId = chairId;
          final sitUser = _restUsers.items.firstWhereOrNull((user) => user.chairId == chairId);
          if (sitUser == null && selectedId == -1) {
            selectedId = chairId;
          }
        });
      });
      // すべて埋まっている場合は、最初を選ぶ
      if (selectedId == -1) selectedId = firstId;
      return selectedId;
    }

    void _onSitChair(int chairId) {
      print("_onSitCahir chairId= ${chairId}");
      _restUsersNotifier.sitRestUser(myUser, chairId);
      _restTimeNotifier.setRemainingTime(INIT_REST_TIME_SEC);
    }

    void _onEditMemoClosed() {
      print("_onEditMemoClosed");
      // 席の空き番号を探して座る
      final chairId = _selectChairId();
      _onSitChair(chairId);
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
      Navigator.pushNamed(context, AppRouter.editDoneRoute, arguments: [done, _onEditMemoClosed]);
    }

    void _onSelectedTime(int value) {
      print("onSelectedTime ${value}");
      _focusTimeNotifier?.setRemainingTime(value);
      _focusNotifier?.setFocusTime(value);
    }

    _onFocusTimer(Timer timer) {
      print("_onFocusTimer()");
      _focusUsersNotifier.calcRemainingTime(DateTime.now());
    }

    final initTime = _focus?.focusTime ?? 0;
    final focusOpa = isFocus ? 0.5:0.01;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  // image: AssetImage("assets/images/bg-morning2.jpg"),
                  image: AssetImage("assets/images/cafe-bg2_1.jpg"),
                  fit: BoxFit.cover,
                )
              ),
              child: Container(
                width: double.infinity,
                color: Colors.white.withOpacity(0.87),
                child: Column(
                  children: [
                    SpaceBox(),
                    SelectFocusTime(onChanged: isFocus ? null : _onSelectedTime),
                    SpaceBox(),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/cafe-bg2_1.jpg"),
                            fit: BoxFit.cover,
                          )
                      ),
                      child: Container(
                        width: double.infinity,
                        color: Colors.white.withOpacity(0.25),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          // color: Colors.black.withOpacity(isFocus ? 0.3:0.1),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight,
                              colors: [
                                const Color(0xff999999).withOpacity(focusOpa),
                                const Color(0xff222244).withOpacity(focusOpa),
                              ],
                              stops: const [
                                0.0,
                                1.0,
                              ],
                            ),
                          ),
                          child: CircleTimer(
                            isStart: isFocus,
                            initTime: initTime,
                            lineColor: Colors.white.withOpacity(0.9),
                            textColor: Colors.white.withOpacity(0.9),
                            onTimer: _onTimer,
                            onCompleted: _onCompleted,
                          )
                        ),
                      ),
                    ),
                    SpaceBox(),
                    // Text("totalPoint=${myUser.totalPoint} activity.dates=${_activity.dates}"),
                    // SpaceBox(),
                    SizedBox(
                      width: 140,
                      height: 48,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          isFocus ? Icons.stop_circle_outlined : Icons.play_circle_outline,
                          color: Colors.white,
                        ),
                        label: Text(
                            isFocus ? '中断する':'集中する',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        onPressed: () {
                          isFocus ? stopTimer(_focus!.focusTime):startTimer(_onTimer);
                        },
                      ),
                    ),
                    SpaceBox(),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/white-bg.jpeg"),
                  fit: BoxFit.cover,
                )
              ),
              child: Column(
                children: [
                  SpaceBox(),
                  WorkingPane(onTimer: _onFocusTimer),
                  SpaceBox(),
                  RoungePane(restUsers: roungeUsers),
                  SpaceBox(),
                  CafeteracePane(restUsers: cafeteraceUsers, myUser: myUser, restUsersNotifier: _restUsersNotifier, onSitChair: _onSitChair, isFocus: _focus?.isFocus ?? false),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
