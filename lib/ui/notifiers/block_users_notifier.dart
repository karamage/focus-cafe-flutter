import 'package:focus_cafe_flutter/data/models/block_user.dart';
import 'package:focus_cafe_flutter/data/models/block_users.dart';
import 'package:focus_cafe_flutter/data/repository/block_user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BlockUsersNotifier extends StateNotifier<BlockUsers> {
  BlockUsersNotifier(BlockUserRepository repository)
      : _repository = repository,
        super(BlockUsers());

  final BlockUserRepository _repository;

  BlockUser? _lastItem;
  bool _isLast = false;
  String _userId = "";
  final LIST_LIMIT = 20;

  Future<void> onRefresh() async {
    state = state.copyWith(isLoading: true);
    await reload(_userId);
  }

  Future<void> reload(String userId) async {
    _userId = userId;
    _clear();
    final list = await _getBlockUsers(userId);
    if (list.length > 0) _lastItem = list.last;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: list, isLoading: false);
  }

  Future<void> next() async {
    if (state.isLoading == true || _isLast) return;
    state = state.copyWith(isLoading: true);
    final list = await _getBlockUsers(_userId);
    _lastItem = list.length > 0 ? list.last : null;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(
        items: [...state.items]..addAll(list), isLoading: false);
  }

  Future<List<BlockUser>> _getBlockUsers(String userId) async {
    return await _repository.getBlockUsers(userId, _lastItem?.createdAt, LIST_LIMIT);
  }

  _clear() {
    _isLast = false;
    _lastItem = null;
  }
}
