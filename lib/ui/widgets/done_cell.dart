import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/providers/block_users_provider.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/ui/widgets/like_button.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';
import 'package:focus_cafe_flutter/util/alert_dialog_manager.dart';
import 'package:focus_cafe_flutter/util/bottom_sheet_dialog.dart';
import 'package:focus_cafe_flutter/util/date_util.dart';
import 'package:focus_cafe_flutter/util/local_storage_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class DoneCell extends HookConsumerWidget {
  final Done done;
  final String myUserId;
  final bool isBlock;
  final Future<void> Function(String doneId) tapLike;
  /*
  final Future<void> Function(Done done) tapComment;
  final Future<void> Function(Done done)? tapEdit;
  final Future<void> Function(Done done)? tapDelete;
  */
  DoneCell({
    required this.done,
    required this.myUserId,
    required this.isBlock,
    required this.tapLike,
    /*
    required this.tapComment,
    this.tapEdit,
    this.tapDelete,
     */
  }) {
    /*
    assert(item != null);
    assert(myUserId != null);
    assert(tapLike != null);
    assert(tapComment != null);
     */
  }

  late BuildContext _context;

  bool isLiked(String userId) => done.likedUserIds?.contains(userId) ?? false;
  bool isMyLiked() => isLiked(myUserId);
  bool isMyItem() => done.user?.id == myUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    return isBlock ? Container():
    Padding(
      key: ValueKey(done.id),
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1.0))
          ),
          //borderRadius: BorderRadius.circular(5.0),
        ),
        child: buildContents(context, ref),
      ),
    );
  }

  Widget buildContents(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildHeaderContents(context, ref),
        SpaceBox.height(8),
        buildMainContents(context),
        buildImageContents(context),
        buildCommentContents(context),
        buildButtonContents(context),
      ],
    );
  }

  Widget buildHeaderContents(BuildContext context, WidgetRef ref) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SpaceBox.width(16),
          Expanded(child: Container()),
          isMyItem() ?
          Container() :
          SizedBox(
            width: 52.0,
            height: 28.0,
            child: TextButton.icon(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.grey,
                size: 16.0,
                semanticLabel: 'Menu',
              ),
              onPressed: () {
                tapMenu(context, ref);
              },
              label: Text(""),
            ),
          ),
          SpaceBox.width(2),
        ]
    );
  }

  tapMenu(BuildContext context, WidgetRef ref) async {
    final blockText = "??????????????????(${done.user?.name})?????????????????????";
    final reportText = "??????????????????????????????????????????";
    void Function(String) func = (label) {
      if (label == blockText) {
        final myUser = ref.watch(myUserProvider);
        final vm = ref.read(blockUsersProvider.notifier);
        vm.addBlockUser(myUser.id!, done.user!);
        BottomSheetDialog.hideBottomSheet(context);
      } else if (label == reportText) {
        reportMail(context);
      }
    };
    BottomSheetDialog.showBottomSheet(
        context,
        [blockText, reportText],
        func);
  }

  reportMail(BuildContext context) async {
    final uuid = await LocalStorageManager.getMyUserId();
    final nickname = await LocalStorageManager.getMyName();
    final itemId = done.id;
    final itemBody = done.body;
    final itemNickname = done.user?.name;
    final body = "????????????:\n${itemId}:${itemBody}:${itemNickname}\n";
    final Email email = Email(
      body: body + '\n?????????:${nickname}:${uuid}\n',
      subject: 'Focus Cafe??????',
      recipients: ['selfnote.appli@gmail.com'],
      cc: [],
      bcc: [],
      attachmentPaths: [],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (e) {
      AlertDialogManager.showAlertDialog(context, "??????????????????????????????????????????", "??????????????????????????????????????????");
    }
  }

  Widget buildImageContents(BuildContext context) {
    return Container();
  }

  Widget buildCommentContents(BuildContext context) {
    return Container();
  }

  Widget buildButtonContents(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: LikeButton(
                isLiked: isMyLiked(),
                likeCount: done.likeCount ?? 0,
                itemId: done.id,
                tapLike: tapLike
            ),
          ),
          /* TODO
          Expanded(
            child: CommentButton(
                item,
                tapComment
            ),
          ),
          if (isMyItem()) Expanded(
              child: ItemEditButton(
                  item,
                  tapEdit
              )
          ),
          if (isMyItem()) Expanded(
              child: ItemDeleteButton(
                  item,
                  tapDelete
              )
          ),
           */
        ],
      ),
    );
  }

  onTapUserAvator(String id) {
    // TODO
    //Navigator.pushNamed(_context, AppRouter.profileRoute, arguments: [id]);
  }

  Widget buildMainContents(BuildContext context) {
    final minutes = (done.totalElapsedTime / 60).floor();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SpaceBox.width(16),
        UserAvator(user: done.user, onTap: onTapUserAvator),
        SpaceBox.width(16),
        //Center(child: Text("${done.user?.name}"))
        Expanded(
          child: GestureDetector(
            // ????????????????????????????????????????????????????????????
            onTap: () {
              //showCommentList(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(done.user?.name ?? "", style: Theme.of(context).textTheme.subtitle2),
                    ),
                    Text(DateUtil.mmdd(done.endDate), style: Theme.of(context).textTheme.caption),
                    SpaceBox.width(4),
                  ],
                ),
                SpaceBox.height(4),
                /*
                if (item.isPublic == true) Text("??????"),
                 */
                Text("${minutes}????????????????????????????????????????????????????????????", style: Theme.of(context).textTheme.subtitle1),
                SpaceBox.height(4),
                Text(done.body, style: Theme.of(context).textTheme.bodyText1),
                SpaceBox.height(4),
              ],
            ),
          ),
        ),
        SpaceBox.width(16),
      ],
    );
  }
}
