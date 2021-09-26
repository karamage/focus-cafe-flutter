import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/focus_time.dart';
import 'package:focus_cafe_flutter/data/models/focus.dart' as FCFocus;
import 'package:focus_cafe_flutter/data/providers/focus_provider.dart';
import 'package:focus_cafe_flutter/data/providers/focus_time_provider.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_time_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/select_focus_time.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:focus_cafe_flutter/util/alert_dialog_manager.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// 画面が遷移したあともタイマーは動き続ける
FocusTime? _focusTime;
FocusTimeNotifier? _focusTimeNotifier;
FCFocus.Focus? _focus;
FocusNotifier? _focusNotifier;

class TimerScreen extends HookConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider);
    final _notifier = ref.read(myUserProvider.notifier);
    _focusTime = ref.watch(focusTimeProvider);
    _focusTimeNotifier = ref.read(focusTimeProvider.notifier);
    _focus = ref.watch(focusProvider);
    _focusNotifier = ref.read(focusProvider.notifier);
    final isFocus = _focusTimeNotifier?.isFocus() ?? false;
    final percent = (_focusTime?.remainingTime ?? 0.0) / (_focus?.focusTime ?? 1.0);
    print("percent=${percent}");
    useEffect((){
      _notifier.reload();
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        if (_focusTime?.remainingTime == 0) {
          _focusTimeNotifier?.stopTimer(_focus!.focusTime);
        }
      });
      return null;
    }, []);

    void _onTimer(Timer timer) {
      print("_onTimer() ${_focusTime?.remainingTime}");
      if ((_focusTime?.remainingTime ?? 0) <= 0) {
        // タイマー完了
        _focusTimeNotifier?.stopTimer(_focus!.focusTime);
        AlertDialogManager.showAlertDialog(context, "タイマー完了", "集中終わり");
      } else {
        _focusTimeNotifier?.setRemainingTime((_focusTime?.remainingTime ?? 0) - 1);
      }
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
          SelectFocusTime(onChanged: _onSelectedTime,),
          //Text("Timer myUser id = ${myUser.id} name=${myUser.name}"),
          SpaceBox(),
          CircularPercentIndicator(
            radius: 240.0,
            lineWidth: 12.0,
            percent: percent,
            center: Text(
                "${_focusTime?.remainingTime}",
                style: TextStyle(fontSize: 50, color: Colors.blueAccent)
            ),
            progressColor: Colors.blueAccent,
          ),
          SpaceBox(),
          //Text("Timer ${_focusTime?.remainingTime}"),
          //SpaceBox(),
          ElevatedButton(
            child: Text(isFocus ? '中断する':'集中する'),
            onPressed: () {
              isFocus ? _focusTimeNotifier?.stopTimer(_focus!.focusTime):_focusTimeNotifier?.startTimer(_onTimer);
            },
          ),
          SpaceBox(),
        ],
      )
    );
  }
}
