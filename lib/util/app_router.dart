
import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/ui/screens/edit_done_memo_screen.dart';
import 'package:focus_cafe_flutter/ui/screens/main_screen.dart';

class AppRouter {
  static const String mainRoute = '/';
  static const String editDoneRoute = '/edit_done';
  /*
  static const String editItemRoute = '/edit_item';
  static const String profileRoute = '/profile';
  static const String commentsRoute = '/comments';
  */

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        return MaterialPageRoute(
          builder: (_) => MainScreen(),
          fullscreenDialog: true,
        );
      case editDoneRoute:
        final args = settings.arguments as List;
        final editDone = args[0] as Done;
        return MaterialPageRoute(
            builder: (_) => EditDoneMemoScreen(editDone: editDone),
            fullscreenDialog: true
        );
        /*
      case editItemRoute:
        final args = settings.arguments as List;
        final editItem = args[0] as Item;
        final callback = args[1] as Function(Item editedItem);
        return MaterialPageRoute(
          builder: (_) => AddItemScreen(editItem: editItem, callback: callback),
        );
      case profileRoute:
        final args = settings.arguments as List;
        final userId = args[0] as String;
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(userId: userId),
        );
      case commentsRoute:
        final args = settings.arguments as List;
        final item = args[0] as Item;
        return MaterialPageRoute(
          builder: (_) => CommentsScreen(item: item),
        );
         */
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
