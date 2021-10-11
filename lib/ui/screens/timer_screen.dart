import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/dones.dart';
import 'package:focus_cafe_flutter/data/models/focus_time.dart';
import 'package:focus_cafe_flutter/data/models/focus.dart' as FCFocus;
import 'package:focus_cafe_flutter/data/providers/dones_provider.dart';
import 'package:focus_cafe_flutter/data/providers/focus_provider.dart';
import 'package:focus_cafe_flutter/data/providers/focus_time_provider.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/dones_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_time_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/circle_timer.dart';
import 'package:focus_cafe_flutter/ui/widgets/select_focus_time.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:focus_cafe_flutter/util/alert_dialog_manager.dart';
import 'package:focus_cafe_flutter/util/app_router.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 画面が遷移したあともタイマーは動き続ける
FocusTime? _focusTime;
FocusTimeNotifier? _focusTimeNotifier;
FCFocus.Focus? _focus;
FocusNotifier? _focusNotifier;
Dones? _dones;
DonesNotifier? _donesNotifier;

class TimerScreen extends HookConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider);
    final _myUserNotifier = ref.read(myUserProvider.notifier);
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
    }

    void stopTimer(int remainingTime) {
      _focusTimeNotifier?.setRemainingTime(remainingTime);
      _focusNotifier?.setIsFocus(false);
      _focusNotifier?.setStartDate(null);
    }

    useEffect((){
      _myUserNotifier.reload();
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        // 初期化
        if (_focusTime?.remainingTime == 0) {
          stopTimer(_focus!.focusTime);
        }
      });
      return null;
    }, []);

    void _onTimer(int remainingTime) {
      print("_onTimer() ${remainingTime}");
      _focusTimeNotifier?.setRemainingTime(remainingTime);
    }

    /*
    void _tapOk() {
      print("_tapOk()");
    }
    */

    void _onCompleted() async {
      print("_onCompleted() ${_dones?.items.length}");
      final startDate = _focus?.startDate ?? DateTime.now();
      final focusTime = _focus?.focusTime ?? INIT_FOCUS_TIME_SEC;
      stopTimer(_focus!.focusTime);
      final done = await _donesNotifier?.addDone(startDate, DateTime.now(), focusTime, myUser, "");
      //AlertDialogManager.showAlertDialog(context, "タイマー完了", "集中終わり", _tapOk);
      Navigator.pushNamed(context, AppRouter.editDoneRoute, arguments: [done]);
    }

    void _onSelectedTime(int value) {
      print("onSelectedTime ${value}");
      _focusTimeNotifier?.setRemainingTime(value);
      _focusNotifier?.setFocusTime(value);
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
        ],
      )
    );
  }
}
