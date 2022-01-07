import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/dones.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/done_repository.dart';
import 'package:focus_cafe_flutter/util/local_storage_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DonesNotifier extends StateNotifier<Dones> {
  DonesNotifier(
      DoneRepository repository,
      [String? userId]
      )
      : _repository = repository,
        //_notificationRepository = notificationRepository,
        //_userRepository = userRepository,
        _userId = userId,
        super(const Dones())
  {
    () async {
      _userId ??= await LocalStorageManager.getMyUserId();
    }();
  }

  final DoneRepository _repository;
  //final NotificationRepository _notificationRepository;
  //final UserRepository _userRepository;

  Done? _lastItem;
  bool _isLast = false;
  String? _userId;

  Future<void> onRefresh() async {
    state = state.copyWith(isLoading: true);
    // TODO
    //await reload();
  }

  Future<Done?> addDone(
      DateTime startDate,
      DateTime endDate,
      int totalElapsedTime,
      User user,
      String body,
      [
        String? questId,
        String? questTitle,
      ]
  ) async {
    final done = await _repository.addDone(startDate, endDate, totalElapsedTime, user, body, questId, questTitle);
    if (done != null) state = state.copyWith(items: [...state.items]..insert(0, done));
    return done;
  }

  Future<Done?> editDoneBody(String id, String body) async {
    final item = await _repository.editDoneBody(id, body);
    if (item != null) {
      final _items = [...state.items];
      _replaceItem(_items, item);
    }
    return item;
  }

  _replaceItem(List<Done> _items, Done item) {
    final index = _items.indexWhere((_item) => _item.id == item.id);
    if (index > -1) {
      _items.removeAt(index);
      _items.insert(index, item);
      state = state.copyWith(items: _items);
    }
  }

  /*
  Future<void> reload() async {
    print("ItemsViewModel reload() start userId=${_userId}");
    _clear();
    final list = await _getItems();
    if (list.length > 0) _lastItem = list.last;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: list, isLoading: false);
    print("ItemsViewModel reload() end");
  }

  Future<void> next() async {
    if (state.isLoading == true || _isLast) return;
    state = state.copyWith(isLoading: true);
    final list = await _getItems();
    _lastItem = list.length > 0 ? list.last : null;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: [...state.items]..addAll(list), isLoading: false);
  }

  Future<Item> editItem(String id, String title, String body, bool isPublic) async {
    final item = await _repository.editItem(id, title, body, isPublic);
    final _items = [...state.items];
    _replaceItem(_items, item);
    return item;
  }

  Future<void> deleteItem(String id) async {
    await _repository.deleteItem(id);
    state = state.copyWith(items: state.items.where((item) => item.id != id).toList());
  }
  */

  Future<void> addLike(String itemId, User myUser) async {
    final done = await _repository.getDone(itemId);
    print("done id=${done?.id} body=${done?.body} user.name=${done?.user?.name}");

    /* TODO
    TSの方を参考に処理する

    1. getDoneを実装
    2. updateDoneを実装 -> すでにeditDoneが存在する -> withConverterを使ったやり方に変更
    3. //お知らせを作成する
      _addLikeNotification(item);
    4. // userのtotalLikedCountをカウントアップ
    5. 未読カウントをカウントアップ
    */

    // awaitせずにlikeする
    _repository.addLike(itemId, myUser);

    var _items = [...state.items];
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index > -1) {
      Done item = _items[index];

      //お知らせを作成する
      //_addLikeNotification(item);

      // userのtotalLikedCountをカウントアップ
      //_userRepository.updateUserLikeCount(item.user.id);

      // ローカルを書き換える
      final List<String?> likedUserIds = [...(item.likedUserIds ?? [])]..add(myUser.id);
      final List<String?> likedUserNames = [...(item.likedUserNames ?? [])]..add(myUser.name);
      final List<String?> likedUserPhotoUrls = [...(item.likedUserPhotoUrls ?? [])]..add(myUser.photoUrl);
      item = item.copyWith(
        likeCount: (item.likeCount ?? 0) + 1,
        likedUserIds: likedUserIds,
        likedUserNames: likedUserNames,
        likedUserPhotoUrls: likedUserPhotoUrls,
      );
      _replaceItem(_items, item);
    }

    /*
    const json = await remote.getDone(id)
    const preDone = json as DoneState
    let likeCount = preDone.likeCount || 0
    likeCount += 1
    const likedUserIds = preDone.likedUserIds || []
    if (myUser.id) {
      likedUserIds.push(myUser.id)
    }
    const likedUserNames = preDone.likedUserNames || []
    likedUserNames.push(myUser.name)
    const likedUserPhotoUrls = preDone.likedUserPhotoUrls || []
    if (myUser.photoUrl) {
      likedUserPhotoUrls.push(myUser.photoUrl)
    }
    const params = {
      likeCount,
      likedUserIds,
      likedUserNames,
      likedUserPhotoUrls,
    }
    const dones = _copyDones()
    const target = dones.find(d => d.id === id)
    if (target) {
      target.likedUserIds = likedUserIds
    }
    setDones((state) => ({
      ...state,
      dones
    }))
    ourDones = dones
    await remote.updateDone(id, params)
    */
  }

  /*
  Future<void> _addLikeNotification(Item item) async {
    String name = await LocalStorageManager.getMyName();
    String uuid = await LocalStorageManager.getMyUserId();
    final body = "$nameさんが「${item.title}」に、いいね！しました。";
    final type = EnumToString.convertToString(NotificationType.like);
    final toUserId = item.user.id;
    final fromUserId = uuid;
    await _notificationRepository.addNotification(body, type, toUserId, fromUserId);
  }


  // Itemの取得場所を切り替える際はrepositoryの実装をDIで切り替えるようにする
  Future<List<Item>> _getItems() async {
    _userId ??= await LocalStorageManager.getMyUserId();
    return await _repository.getItems(userId: _userId, lastItem: _lastItem);
  }
   */

  _clear() {
    _isLast = false;
    _lastItem = null;
  }
}
