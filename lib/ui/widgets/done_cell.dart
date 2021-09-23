import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';

// ignore: must_be_immutable
class DoneCell extends StatelessWidget {
  final Done done;
  final String myUserId;
  /*
  final Future<void> Function(Done done) tapComment;
  final Future<void> Function(String doneId) tapLike;
  final Future<void> Function(Done done)? tapEdit;
  final Future<void> Function(Done done)? tapDelete;
  */
  DoneCell({
    required this.done,
    required this.myUserId,
    /*
    required this.tapComment,
    required this.tapLike,
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

  /*
  bool isLiked(String userId) => item?.likedUserIds?.contains(userId) ?? false;
  bool isMyLiked() => isLiked(myUserId);
  bool isMyItem() => item?.user?.id == myUserId;
   */

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Padding(
      key: ValueKey(done.id),
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1.0))
          ),
          //borderRadius: BorderRadius.circular(5.0),
        ),
        child: buildContents(context),
      ),
    );
  }

  Widget buildContents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //buildHeaderContents(context),
        //SpaceBox.height(8),
        buildMainContents(context),
        buildImageContents(context),
        buildCommentContents(context),
        buildButtonContents(context),
      ],
    );
  }

  Widget buildHeaderContents(BuildContext context) {
    return Container();
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
          /* TODO
          Expanded(
            child: CommentButton(
                item,
                tapComment
            ),
          ),
          Expanded(
            child: LikeButton(
                isLiked: isMyLiked(),
                likeCount: item.likeCount,
                itemId: item.id,
                tapLike: tapLike
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
            // タップしたらコメント画面に遷移するように
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
                    //Text(item.createdAtMMDD(), style: Theme.of(context).textTheme.caption),
                    SpaceBox.width(4),
                  ],
                ),
                SpaceBox.height(4),
                /*
                if (item.isPublic == true) Text("公開"),
                 */
                Text("${minutes}分間のポモドーロタイマーを完了しました。", style: Theme.of(context).textTheme.subtitle1),
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
