import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    /*
    final appState = useProvider(appStateProvider.state);
    if (appState.stateType == AppStateType.initCompleted) {
      setLoginState();
    }
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
     */
    return Scaffold(
      body: Center(
          child: Text('Main')),
    );
  }

  setLoginState() async {
    /*
    final appStateViewModel = useProvider(appStateProvider);
    final auth = useProvider(authProvider);
    final myUserViewModel = useProvider(myUserProvider);
    final userId = await myUserViewModel.getMyUserId();
    if (userId != null) {
      auth.login();
      appStateViewModel.setAppStateType(AppStateType.loginCompleted);
    } else {
      appStateViewModel.setAppStateType(AppStateType.login);
    }
     */
  }
}
