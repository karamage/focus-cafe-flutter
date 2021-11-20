import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class WrapTimer extends StatefulWidget {
  final bool isStart;
  final int initTime;
  final void Function(int) onTimer;
  final void Function() onCompleted;
  final Widget child;

  WrapTimer({
    Key? key,
    required this.child,
    required this.isStart,
    required this.initTime,
    required this.onTimer,
    required this.onCompleted
  }) : super(key: key);

  @override
  WrapTimerState createState() => WrapTimerState();
}

class WrapTimerState extends State<WrapTimer> with WidgetsBindingObserver {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  int remainingTime = 0;
  Timer? timer = null;

  bool _isTimerPaused = false; // バックグラウンドに遷移した際にタイマーがもともと起動中で、停止したかどうか
  DateTime? _pausedTime; // バックグラウンドに遷移した時間
  int? _notificationId; // 通知ID

  @override
  void initState() {
    print("----WrapTimer initState---");
    super.initState();
    remainingTime = widget.initTime;
    timer = null;
    WidgetsBinding.instance!.addObserver(this);
    _setupTimeZone();
    _initLocalNotification();
  }

  @override
  void dispose() {
    print("----WrapTimer dispose---");
    WidgetsBinding.instance!.removeObserver(this);
    _stopTimer();
    super.dispose();
  }

  // タイムゾーンを設定する
  Future<void> _setupTimeZone() async {
    tz.initializeTimeZones();
    var tokyo = tz.getLocation('Asia/Tokyo');
    tz.setLocalLocation(tokyo);
  }

  /// アプリがバックグラウンドに遷移した際のハンドラ
  void _handleOnPaused() {
    if (timer?.isActive == true) {
      _isTimerPaused = true;
      timer?.cancel(); // タイマーを停止する
    }
    _pausedTime = DateTime.now(); // バックグラウンドに遷移した時間を記録
    _notificationId = _scheduleLocalNotification(Duration(seconds: remainingTime)); // ローカル通知をスケジュール登録
  }

  /// アプリがフォアグラウンドに復帰した際のハンドラ
  void _handleOnResumed() {
    if (_isTimerPaused != true) return; // タイマーが動いてなければ何もしない
    Duration backgroundDuration = DateTime.now().difference(_pausedTime!); // バックグラウンドでの経過時間
    // バックグラウンドでの経過時間が終了予定を超えていた場合（この場合は通知実行済みのはず）
    print("backgroundDuration.inSeconds = ${backgroundDuration.inSeconds}");
    if (remainingTime - backgroundDuration.inSeconds <= 0) {
      _stopTimer();
      widget.onCompleted();
    } else {
      setState(() {
        remainingTime = remainingTime - backgroundDuration.inSeconds;
      });
      _startTimer(); // タイマーを再開する
    }
    if (_notificationId != null) flutterLocalNotificationsPlugin.cancel(_notificationId!); // 通知をキャンセル
    _isTimerPaused = false; // リセット
    _notificationId = null; // リセット
    _pausedTime = null;
  }

  /// ライフサイクルが変更された際に呼び出される関数をoverrideして、変更を検知
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // バックグラウンドに遷移した時
      print("background");
      _handleOnPaused();
    } else if (state == AppLifecycleState.resumed) {
      // フォアグラウンドに復帰した時
      print("foreground");
      _handleOnResumed();
    }
  }

  void _initLocalNotification() {
    flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(android: AndroidInitializationSettings('app_icon'), iOS: IOSInitializationSettings()), // app_icon.pngを配置
    );
  }

  /// タイマー終了をローカル通知
  int _scheduleLocalNotification(Duration duration) {
    print('notification scheduled. ${duration.toString()}');
    int notificationId = DateTime.now().hashCode;
    flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        'Time is over',
        '',
        tz.TZDateTime.now(tz.local).add(duration),
        NotificationDetails(
          // TODO Android Setting
            android: AndroidNotificationDetails('your channel id', 'your channel name',
                importance: Importance.max, priority: Priority.high),
            iOS: IOSNotificationDetails()),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true
    );
    return notificationId;
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
    setState(() {
      timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
    });
  }

  void _stopTimer() {
    timer?.cancel();
    setState(() {
      remainingTime = widget.initTime;
      timer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_WrapTimerState build isStart=${widget.isStart} percent=${remainingTime / widget.initTime}");
    if (widget.isStart && timer == null) {
      _startTimer();
    } else if (!widget.isStart) {
      _stopTimer();
    }
    return Container(child: widget.child);
  }

  String getTimeStr(int totalSec) {
    final minutes = (totalSec / 60).floor();
    final sec = (totalSec % 60).floor();
    return "${minutes.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}";
  }
}

