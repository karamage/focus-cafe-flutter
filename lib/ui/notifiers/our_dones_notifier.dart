import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/repository/done_repository.dart';
import 'package:focus_cafe_flutter/data/repository/notification_repository.dart';
import 'package:focus_cafe_flutter/data/repository/user_repository.dart';
import 'package:focus_cafe_flutter/ui/notifiers/dones_notifier.dart';

class OurDonesNotifier extends DonesNotifier {
  OurDonesNotifier(DoneRepository repository, NotificationRepository notificationRepository, UserRepository userRepository)
      : _repository = repository,
        super(repository, notificationRepository, userRepository);

  final DoneRepository _repository;

  Done? _lastItem;
  bool _isLast = false;
  final LIST_LIMIT = 20;

  Future<void> onRefresh() async {
    state = state.copyWith(isLoading: true);
    await reload();
  }

  Future<void> reload() async {
    _clear();
    final list = await _getOurDones();
    if (list.length > 0) _lastItem = list.last;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: list, isLoading: false);
  }

  Future<void> next() async {
    if (state.isLoading == true || _isLast) return;
    state = state.copyWith(isLoading: true);
    final list = await _getOurDones();
    _lastItem = list.length > 0 ? list.last : null;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: [...state.items]..addAll(list), isLoading: false);
  }

  // Itemの取得場所を切り替える際はrepositoryの実装をDIで切り替えるようにする
  Future<List<Done>> _getOurDones() async {
    return await _repository.getOurDones(_lastItem, LIST_LIMIT);
  }

  _clear() {
    _isLast = false;
    _lastItem = null;
  }
}
