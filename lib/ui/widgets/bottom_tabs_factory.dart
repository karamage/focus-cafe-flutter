import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/ui/screens/notifications_screen.dart';
import 'package:focus_cafe_flutter/ui/screens/our_dones_screen.dart';
import 'package:focus_cafe_flutter/ui/screens/timer_screen.dart';

class BottomTabsFactory {
  static String headerTitle(int index) {
    switch (index) {
      case 0:
        return "集中タイマー";
      case 1:
        return "みんなの集中記録";
      case 2:
        return "お知らせ";
      case 3:
        return "設定";
      default:
        return "";
    }
  }

  static List<Widget> getPages() {
    return [
      TimerScreen(),
      OurDonesScreen(),
      NotificationsScreen(),
      OurDonesScreen(), //TODO
    ];
  }

  static List<BottomNavigationBarItem> getTabItems() {
    return [
      BottomNavigationBarItem( // call each bottom item
        icon: Icon(Icons.home),
        label: '集中タイマー',
      ),
      BottomNavigationBarItem( // call each bottom item
        icon: Icon(Icons.cloud),
        label: 'みんなの記録',
      ),
      BottomNavigationBarItem( // call each bottom item
        icon: Icon(Icons.wifi),
        label: 'お知らせ',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: '設定',
      )
    ];
  }
}
