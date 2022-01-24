import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/data/providers/our_dones_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/our_dones_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/done_cell.dart';
import 'package:focus_cafe_flutter/ui/widgets/easy_list_view.dart';
import 'package:focus_cafe_flutter/ui/widgets/loading_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OurDonesScreen extends HookConsumerWidget {
  late OurDonesNotifier _notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ourDonesProvider);
    final myUser = ref.watch(myUserProvider);
    _notifier = ref.read(ourDonesProvider.notifier);
    useEffect((){
      _notifier.reload();
      return null;
    }, []);
    final tapLike = (String itemId) async {
      _notifier.addLike(itemId, myUser);
    };
    return EasyListView(
      items: state.items,
      onRefresh: _notifier.onRefresh,
      onNext: _notifier.next,
      buildCells: (items) =>
          items.map((item) =>
              DoneCell(
                done: item as Done,
                myUserId: myUser.id ?? "",
                tapLike: tapLike,
                //tapComment: tapComment,
              )
          ).toList(),
      isLoading: state.isLoading,
      loading: LoadingIndicator(),
    );
  }

}
