import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/providers/user_dones_provider.dart';
import 'package:focus_cafe_flutter/data/providers/user_provider.dart';
import 'package:focus_cafe_flutter/ui/widgets/done_cell.dart';
import 'package:focus_cafe_flutter/ui/widgets/easy_list_view.dart';
import 'package:focus_cafe_flutter/ui/widgets/loading_indicator.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';
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
          header: _buildHeader(context, user),
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

  Widget _buildHeader(BuildContext ctx, User user) {
    return Column(                                        //modified
        children: <Widget>[                                         //new
          Material(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            elevation: 0.0,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      child: UserAvator(user: user),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Text(user.name, style: Theme.of(ctx).textTheme.subtitle1),
                          ),
                          SpaceBox(height: 8.0),
                          Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Text("${user.desc}"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SpaceBox(height: 8.0),
                Text("総ポイント ${user.totalPoint}pt"),
                SpaceBox(height: 8.0),
                Text("いいね！されてる数 ${user.totalLikedCount}いいね！"),
                SpaceBox(height: 16.0),
                //SpaceBox(height: 16.0),
                Divider(height: 1.0),                                 //new
                Container(
                  child: Text("ポモドーロ集中記録", style: Theme.of(ctx).textTheme.caption),
                ),
                Divider(height: 1.0),                                 //new
              ],
            ),
          ),
        ]);
  }
}
