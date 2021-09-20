import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/providers/our_dones_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/our_dones_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OurDonesScreen extends HookConsumerWidget {
  late OurDonesNotifier _notifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _notifier = ref.read(ourDonesProvider.notifier);
    return Center(
        child: Text("Our Dones")
    );
  }
}
