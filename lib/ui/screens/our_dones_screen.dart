import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/dones.dart';
import 'package:focus_cafe_flutter/data/providers/our_dones_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/our_dones_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OurDonesScreen extends HookConsumerWidget {
  late OurDonesNotifier _notifier;
  late BuildContext _context;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dones = ref.watch(ourDonesProvider);
    _notifier = ref.read(ourDonesProvider.notifier);
    _context = context;
    useEffect((){
      _notifier.reload();
      return null;
    }, []);
    return Center(
        child: Text("Our Dones ${dones.items.length}")
    );
  }
}
