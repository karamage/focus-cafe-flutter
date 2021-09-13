import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Note: CounterApp is a HookWidget, from flutter_hooks.
class HomeScreen extends HookConsumerWidget {
  final PageController pageController = new PageController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final state = useProvider(appStateProvider.state);
    //final app = useProvider(appStateProvider);
    return Scaffold(
      body: Center(
        child: Text("Home"),
      ),
      /*
      appBar: WhiteAppBar.build(BottomTabsFactory.headerTitle(state.selectedTabIndex)),
      body: new PageView(
        controller: pageController,
        onPageChanged: (int index) {
          app.setSelectedTab(index);
        },
        children: BottomTabsFactory.getPages(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed, // for item 3 over.
        onTap: (int index) { // define animation
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 10), curve: Curves.ease);
        },
        currentIndex: state.selectedTabIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color(0xffcccccc),
        items: BottomTabsFactory.getTabItems(),
      ),
      floatingActionButton: _buildFab(context, state.selectedTabIndex),
      */
    );
  }
  /*
  Widget _buildFab(BuildContext context, int index) {
    if (index != 0) return null;
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRouter.addItemRoute, arguments: [addedItemCallback]);
      },
      child: Icon(Icons.add),
      //backgroundColor: Theme.of(context).primaryColor,
    );
  }

  addedItemCallback(Item addedItem) {
  }
  */
}
