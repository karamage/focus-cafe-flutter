import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Timer? timer;

class CircleTimer extends StatefulWidget {
  final bool isStart;
  final int initTime;
  final void Function(int) onTimer;
  final void Function() onCompleted;

  CircleTimer({
    required this.isStart,
    required this.initTime,
    required this.onTimer,
    required this.onCompleted
  });

  @override
  _CircleTimerState createState() => _CircleTimerState();
}

class _CircleTimerState extends State<CircleTimer> with WidgetsBindingObserver {
  int remainingTime = 0;

  bool _isTimerPaused = false; // バックグラウンドに遷移した際にタイマーがもともと起動中で、停止したかどうか
  DateTime? _pausedTime; // バックグラウンドに遷移した時間
  int? _notificationId; // 通知ID

  @override
  void initState() {
    super.initState();
    remainingTime = widget.initTime;
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  /// アプリがバックグラウンドに遷移した際のハンドラ
  void _handleOnPaused() {
    /* TODO
    if (_timer.isActive) {
      _isTimerPaused = true;
      _timer.cancel(); // タイマーを停止する
    }
    _pausedTime = DateTime.now(); // バックグラウンドに遷移した時間を記録
    _notificationId = _scheduleLocalNotification(_time.difference(DateTime.utc(0, 0, 0))); // ローカル通知をスケジュール登録
     */
  }

  /// アプリがフォアグラウンドに復帰した際のハンドラ
  void _handleOnResumed() {
    /* TODO
    if (_isTimerPaused == null) return; // タイマーが動いてなければ何もしない
    Duration backgroundDuration = DateTime.now().difference(_pausedTime); // バックグラウンドでの経過時間
    // バックグラウンドでの経過時間が終了予定を超えていた場合（この場合は通知実行済みのはず）
    if (_time.difference(DateTime.utc(0, 0, 0)).compareTo(backgroundDuration) < 0) {
      _time = DateTime.utc(0, 0, 0); // 時間をリセットする
    } else {
      _time = _time.add(-backgroundDuration); // バックグラウンド経過時間分時間を進める
      _startTimer(); // タイマーを再開する
    }
    if (_notificationId != null) flutterLocalNotificationsPlugin.cancel(_notificationId); // 通知をキャンセル
    _isTimerPaused = false; // リセット
    _notificationId = null; // リセット
    _pausedTime = null;
    */
  }

  /// ライフサイクルが変更された際に呼び出される関数をoverrideして、変更を検知
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // バックグラウンドに遷移した時
      // setState(_handleOnPaused);
      print("background");
    } else if (state == AppLifecycleState.resumed) {
      // フォアグラウンドに復帰した時
      // setState(_handleOnResumed);
      print("foreground");
    }
  }

  void _onTimer(Timer timer) {
    final nextTime = remainingTime - 1;
    widget.onTimer(nextTime);
    setState(() {
      remainingTime = nextTime;
    });

    // 完了
    if (nextTime <= 0) {
      _stopTimer();
      widget.onCompleted();
    }
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
  }

  void _stopTimer() {
    timer?.cancel();
    timer = null;
    setState(() {
      remainingTime = widget.initTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_CircleTimerState build isStart=${widget.isStart} percent=${remainingTime / widget.initTime}");
    if (widget.isStart && timer == null) {
      _startTimer();
    } else if (!widget.isStart) {
      _stopTimer();
    }

    var percent = remainingTime / widget.initTime;
    if (percent > 1.0) {
      percent = 1.0;
    }

    return CircularPercentIndicator(
      radius: 240.0,
      lineWidth: 16.0,
      percent: percent,
      center: Text(
          getTimeStr(remainingTime),
          style: TextStyle(fontSize: 32, color: Colors.blueAccent)
      ),
      progressColor: Colors.blueAccent,
    );
  }
}

String getTimeStr(int totalSec) {
  final minutes = (totalSec / 60).floor();
  final sec = (totalSec % 60).floor();
  return "${minutes.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}";
}

