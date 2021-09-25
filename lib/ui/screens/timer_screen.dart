import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/focus_time.dart';
import 'package:focus_cafe_flutter/data/providers/focus_time_provider.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_time_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:focus_cafe_flutter/util/alert_dialog_manager.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 画面が遷移したあともタイマーは動き続ける
FocusTime? _focusTime;
FocusTimeNotifier? _focusTimeNotifier;

class TimerScreen extends HookConsumerWidget {

  void startTimer(void Function(Timer) onTimer) {
    final timer = Timer.periodic(const Duration(seconds: 1), onTimer);
    _focusTimeNotifier?.setTimer(timer);
  }

  void stopTimer() {
    _focusTime?.timer?.cancel();
    _focusTimeNotifier?.setTimer(null);
    _focusTimeNotifier?.setRemainingTime(INIT_FOCUS_TIME_SEC);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider);
    final _notifier = ref.read(myUserProvider.notifier);
    _focusTime = ref.watch(focusTimeProvider);
    _focusTimeNotifier = ref.read(focusTimeProvider.notifier);
    final isFocus = _focusTimeNotifier?.isFocus() ?? false;
    useEffect((){
      _notifier.reload();
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        if (_focusTime?.remainingTime == 0) {
          _focusTimeNotifier?.setRemainingTime(INIT_FOCUS_TIME_SEC);
        }
      });
      return null;
    }, []);

    void _onTimer(Timer timer) {
      print("_onTimer()");
      if ((_focusTime?.remainingTime ?? 0) <= 0) {
        // タイマー完了
        stopTimer();
        AlertDialogManager.showAlertDialog(context, "タイマー完了", "集中終わり");
      } else {
        _focusTimeNotifier?.setRemainingTime((_focusTime?.remainingTime ?? 0) - 1);
      }
    }

    return Center(
      child: Column(
        children: [
          //Text("Timer myUser id = ${myUser.id} name=${myUser.name}"),
          SpaceBox(),
          Text("Timer ${_focusTime?.remainingTime}"),
          ElevatedButton(
            child: Text(isFocus ? '中断する':'集中する'),
            onPressed: () {
              isFocus ? stopTimer():startTimer(_onTimer);
            },
          ),
        ],
      )
    );
  }
}
