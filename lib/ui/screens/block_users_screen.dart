import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/block_user.dart';
import 'package:focus_cafe_flutter/data/providers/block_users_provider.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/block_users_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/block_user_cell.dart';
import 'package:focus_cafe_flutter/ui/widgets/easy_list_view.dart';
import 'package:focus_cafe_flutter/ui/widgets/loading_indicator.dart';
import 'package:focus_cafe_flutter/ui/widgets/white_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BlockUsersScreen extends HookConsumerWidget {
  late BlockUsersNotifier _notifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(blockUsersProvider);
    final myUser = ref.watch(myUserProvider);
    _notifier = ref.read(blockUsersProvider.notifier);
    useEffect((){
      final userId = myUser.id;
      if (userId != null) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          _notifier.reload(userId);
        });
      }
      return null;
    }, []);
    return Scaffold(
      appBar: WhiteAppBar.build("ブロックユーザー一覧", null),
      body: Center(
          child: EasyListView(
            items: state.items,
            onRefresh: _notifier.onRefresh,
            onNext: _notifier.next,
            emptyState: Center(child: Text("ブロックしているユーザーはいません")),
            paddingTop: 0,
            buildCells: (items) =>
                items.map((item) =>
                    BlockUserCell(item: item as BlockUser)
                ).toList(),
            isLoading: state.isLoading,
            loading: LoadingIndicator(),
          )
      ),
    );
  }
}
