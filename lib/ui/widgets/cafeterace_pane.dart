import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/providers/rest_time_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/rest_time_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/rest_users_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/cafe_table_cell.dart';
import 'package:focus_cafe_flutter/ui/widgets/text_timer.dart';
import 'package:focus_cafe_flutter/util/alert_dialog_manager.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const cafeTables = [
  { "id": 1, "chairs": [{ "id": 11 }, { "id": 12 }] },
  { "id": 2, "chairs": [{ "id": 21 }, { "id": 22 }] },
  { "id": 3, "chairs": [{ "id": 31 }, { "id": 32 }] },
  { "id": 4, "chairs": [{ "id": 41 }, { "id": 42 }] },
  { "id": 5, "chairs": [{ "id": 51 }, { "id": 52 }] },
  { "id": 6, "chairs": [{ "id": 61 }, { "id": 62 }] },
  { "id": 7, "chairs": [{ "id": 71 }, { "id": 72 }] },
  { "id": 8, "chairs": [{ "id": 81 }, { "id": 82 }] },
];
// ignore: must_be_immutable
class CafeteracePane extends HookConsumerWidget {
  final List<RestUser> restUsers;
  final User myUser;
  final RestUsersNotifier restUsersNotifier;
  final Function(int) onSitChair;
  CafeteracePane({
    required this.restUsers,
    required this.myUser,
    required this.restUsersNotifier,
    required this.onSitChair
  }) {
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMySit = restUsers.any((user) => user.id == myUser.id);
    final restTime = ref.watch(restTimeProvider);
    final restTimeNotifier = ref.read(restTimeProvider.notifier);
    print("restTime.remainingTime=${restTime.remainingTime}");
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(230, 230, 230, 1.0)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(context, isMySit),
          buildTimer(context, isMySit, restTimeNotifier, restTime.remainingTime),
          buildContents(context),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context, bool isMySit) {
    return isMySit ? ElevatedButton(onPressed: () {
      restUsersNotifier.addRestUser(myUser);
    }, child: Text("戻る")) : Text("カフェテラス");
  }

  Widget buildTimer(BuildContext context, bool isMySit, RestTimeNotifier restTimeNotifier, int remainingTime) {
    return isMySit ?
      TextTimer(isStart: remainingTime >= 0, initTime: INIT_REST_TIME_SEC,
          onTimer: (time){
            restTimeNotifier.setRemainingTime(time - 1);
          },
          onCompleted: (){
            AlertDialogManager.showAlertDialog(context, "休憩完了", "リフレッシュできましたか?\nさぁ、次のポモドーロへGO！");
          })
      : Container();
  }

  Widget buildContents(BuildContext context) {
    return Wrap(
      children: <CafeTableCell>[
        ...cafeTables.map((tableData) {
          return CafeTableCell(tableData: tableData, restUsers: restUsers, onSitChair: onSitChair);
        }).toList()
      ],
    );
  }
}
