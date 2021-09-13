import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/app_state_type.dart';
import 'package:focus_cafe_flutter/data/providers/app_state_provider.dart';
import 'package:focus_cafe_flutter/data/providers/auth_provider.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/ui/screens/home_screen.dart';
import 'package:focus_cafe_flutter/ui/screens/login_screen.dart';
import 'package:focus_cafe_flutter/ui/screens/splash_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    useEffect((){
      if (appState.stateType == AppStateType.initCompleted) {
        setLoginState(ref);
      }
    }, [appState.stateType]);
    switch (appState.stateType) {
      case AppStateType.init:
        return SplashScreen();
      case AppStateType.initCompleted:
        return SplashScreen(); //TODO
      case AppStateType.walkthrough:
        return SplashScreen(); //TODO
      case AppStateType.login:
        return LoginScreen();
      case AppStateType.loginCompleted:
        return HomeScreen();
    }
    return Scaffold(
      body: Center(
          child: Text('Another ${appState.stateType}')),
    );
  }

  setLoginState(WidgetRef ref) async {
    final appStateViewModel = ref.read(appStateProvider.notifier);
    final auth = ref.read(authProvider.notifier);
    final myUserViewModel = ref.read(myUserProvider.notifier);
    final userId = await myUserViewModel.getMyUserId();
    if (userId != null) {
      auth.login();
      appStateViewModel.setAppStateType(AppStateType.loginCompleted);
    } else {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        appStateViewModel.setAppStateType(AppStateType.login);
      });
    }
  }
}
