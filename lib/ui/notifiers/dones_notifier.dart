import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/dones.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/done_repository.dart';
import 'package:focus_cafe_flutter/data/repository/notification_repository.dart';
import 'package:focus_cafe_flutter/data/repository/user_repository.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:focus_cafe_flutter/util/local_storage_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DonesNotifier extends StateNotifier<Dones> {
  DonesNotifier(
      DoneRepository repository,
      NotificationRepository notificationRepository,
      UserRepository userRepository,
      [String? userId]
      )
      : _repository = repository,
        _notificationRepository = notificationRepository,
        _userRepository = userRepository,
        _userId = userId,
        super(const Dones())
  {
    () async {
      _userId ??= await LocalStorageManager.getMyUserId();
    }();
  }

  final DoneRepository _repository;
  final NotificationRepository _notificationRepository;
  final UserRepository _userRepository;

  Done? _lastItem;
  bool _isLast = false;
  String? _userId;

  Future<void> onRefresh() async {
    state = state.copyWith(isLoading: true);
    await reload();
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

  Future<void> reload() async {
    _clear();
    final list = await _getUserDones();
    if (list.length > 0) _lastItem = list.last;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: list, isLoading: false);
  }

  Future<void> next() async {
    if (state.isLoading == true || _isLast) return;
    state = state.copyWith(isLoading: true);
    final list = await _getUserDones();
    _lastItem = list.length > 0 ? list.last : null;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: [...state.items]..addAll(list), isLoading: false);
  }

  Future<List<Done>> _getUserDones() async {
    return await _repository.getUserDones(_userId ?? "", _lastItem, LIST_LIMIT);
  }

  /*
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

    // notification作成
    final toUser = done?.user;
    if (toUser != null && done != null) {
      // awaitせずにlikeする
      _repository.addLike(itemId, myUser);

      // お知らせを作成する
      _notificationRepository.addLikeNotification(toUser, myUser, done);

      // userのtotalLikedCountをカウントアップ
      _userRepository.updateUserTotalLikedCount(toUser.id ?? "", 1);

      // userの未読カウントアップ
      _userRepository.updateUserUnreadCount(toUser.id ?? "", 1);

      // ローカルを書き換える
      final List<String?> likedUserIds = [...(done.likedUserIds ?? [])]..add(myUser.id);
      final List<String?> likedUserNames = [...(done.likedUserNames ?? [])]..add(myUser.name);
      final List<String?> likedUserPhotoUrls = [...(done.likedUserPhotoUrls ?? [])]..add(myUser.photoUrl);
      final item = done.copyWith(
        likeCount: (done.likeCount ?? 0) + 1,
        likedUserIds: likedUserIds,
        likedUserNames: likedUserNames,
        likedUserPhotoUrls: likedUserPhotoUrls,
      );
      final _items = [...state.items];
      _replaceItem(_items, item);
    }
  }

  _clear() {
    _isLast = false;
    _lastItem = null;
  }
}
