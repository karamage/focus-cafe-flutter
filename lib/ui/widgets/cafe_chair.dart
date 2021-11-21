import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/data/providers/rest_time_provider.dart';
import 'package:focus_cafe_flutter/data/providers/rest_users_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/rest_time_notifier.dart';
import 'package:focus_cafe_flutter/ui/notifiers/rest_users_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CafeChair extends HookConsumerWidget {
  final Map<String, Object> chairData;
  final String imagePath;
  final RestUser? restUser;
  late RestUsersNotifier _restUsersNotifier;
  late RestTimeNotifier _restTimeNotifier;

  CafeChair({required this.chairData, required this.imagePath, required this.restUser});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider);
    _restUsersNotifier = ref.read(restUsersProvider.notifier);
    _restTimeNotifier = ref.read(restTimeProvider.notifier);
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: SizedBox(
        width: 60,
        height: 20,
        child: restUser == null ? ElevatedButton(
          child: Text(
            "休憩",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          onPressed: () {
            _restUsersNotifier.sitRestUser(myUser, chairData["id"] as int);
            _restTimeNotifier.setRemainingTime(INIT_REST_TIME_SEC);
          },
        ) : UserAvator(user: restUser?.user),
      )
    );
  }
}
