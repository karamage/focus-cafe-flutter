import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/focus_time.dart';
import 'package:focus_cafe_flutter/data/providers/focus_time_provider.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/focus_time_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 画面が遷移したあともタイマーは動き続ける
FocusTime? _focusTime;
FocusTimeNotifier? _focusTimeNotifier;

class TimerScreen extends HookConsumerWidget {
  void _onTimer(Timer timer) {
    print("_onTimer()");
    _focusTimeNotifier?.setRemainingTime((_focusTime?.remainingTime ?? 0) - 1);
  }

  void startTimer() {
    final timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
    _focusTimeNotifier?.setTimer(timer);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider);
    final _notifier = ref.read(myUserProvider.notifier);
    _focusTime = ref.watch(focusTimeProvider);
    _focusTimeNotifier = ref.read(focusTimeProvider.notifier);
    useEffect((){
      _notifier.reload();
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        if (_focusTime?.remainingTime == 0) {
          _focusTimeNotifier?.setRemainingTime(60);
        }
      });
      return null;
    }, []);
    return Center(
      child: Column(
        children: [
          Text("Timer myUser id = ${myUser.id} name=${myUser.name}"),
          Text("Timer ${_focusTime?.remainingTime}"),
          ElevatedButton(
            child: Text('集中する'),
            onPressed: () {
              startTimer();
            },
          ),
        ],
      )
    );
  }
}
