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
import 'package:percent_indicator/circular_percent_indicator.dart';

// 画面が遷移したあともタイマーは動き続ける
FocusTime? _focusTime;
FocusTimeNotifier? _focusTimeNotifier;

class TimerScreen extends HookConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider);
    final _notifier = ref.read(myUserProvider.notifier);
    _focusTime = ref.watch(focusTimeProvider);
    _focusTimeNotifier = ref.read(focusTimeProvider.notifier);
    final isFocus = _focusTimeNotifier?.isFocus() ?? false;
    final percent = (_focusTime?.remainingTime ?? 0) / INIT_FOCUS_TIME_SEC;
    useEffect((){
      _notifier.reload();
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        if (_focusTime?.remainingTime == 0) {
          _focusTimeNotifier?.stopTimer();
        }
      });
      return null;
    }, []);

    void _onTimer(Timer timer) {
      print("_onTimer() ${_focusTime?.remainingTime}");
      if ((_focusTime?.remainingTime ?? 0) <= 0) {
        // タイマー完了
        _focusTimeNotifier?.stopTimer();
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
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            percent: percent,
            center: new Text("${(percent * 100).floor()}%"),
            progressColor: Colors.green,
          ),
          SpaceBox(),
          Text("Timer ${_focusTime?.remainingTime}"),
          SpaceBox(),
          ElevatedButton(
            child: Text(isFocus ? '中断する':'集中する'),
            onPressed: () {
              isFocus ? _focusTimeNotifier?.stopTimer():_focusTimeNotifier?.startTimer(_onTimer);
            },
          ),
          SpaceBox(),
        ],
      )
    );
  }
}
