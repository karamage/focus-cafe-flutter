import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/providers/user_dones_provider.dart';
import 'package:focus_cafe_flutter/data/providers/user_provider.dart';
import 'package:focus_cafe_flutter/ui/widgets/done_cell.dart';
import 'package:focus_cafe_flutter/ui/widgets/easy_list_view.dart';
import 'package:focus_cafe_flutter/ui/widgets/loading_indicator.dart';
import 'package:focus_cafe_flutter/ui/widgets/white_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserScreen extends HookConsumerWidget {
  final userId;
  UserScreen({required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider(userId));
    final dones = ref.watch(userDonesProvider(userId));
    final _userNotifier = ref.read(userProvider(userId).notifier);
    final _donesNotifier = ref.read(userDonesProvider(userId).notifier);
    useEffect((){
      _userNotifier.reload();
      _donesNotifier.reload();
    }, []);
    final tapLike = (String itemId) async {
      //_notifier.addLike(itemId, myUser);
    };
    return Scaffold(
      appBar: WhiteAppBar.build("プロフィール", null),
      body: EasyListView(
          items: dones.items,
          onRefresh: _donesNotifier.onRefresh,
          onNext: _donesNotifier.next,
          header: Container(
            padding: EdgeInsets.all(30.0),
            child: Center(child: Text("${user.name}")),
          ),
          buildCells: (items) =>
              items.map((item) =>
                  DoneCell(
                    done: item as Done,
                    myUserId: user.id ?? "",
                    tapLike: tapLike,
                    //tapComment: tapComment,
                  )
              ).toList(),
          isLoading: dones.isLoading,
          loading: LoadingIndicator(),
        )
    );
  }
}
