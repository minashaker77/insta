import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_insta/saved_screen.dart';

// this is a bottom navigation bar screen with on will pop option

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int currentIndex = 1;
  //
  // changeIndex(index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }
  BottomNavItem selectedItem = BottomNavItem.one;

  final Map<BottomNavItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavItem.one: GlobalKey<NavigatorState>(),
    BottomNavItem.two: GlobalKey<NavigatorState>(),
    BottomNavItem.three: GlobalKey<NavigatorState>(),
  };

  final Map<BottomNavItem, IconData> items = const {
    BottomNavItem.one: Icons.home,
    BottomNavItem.two: Icons.add,
    BottomNavItem.three: Icons.account_circle,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            // This is when you want to remove all the pages from the
            // stack for the specific BottomNav item.
            navigatorKeys[selectedItem]
                ?.currentState
                ?.popUntil((route) => route.isFirst);

            return false;
          },
          child: Stack(
            children: items
                .map(
                  (item, _) => MapEntry(
                    item,
                    _buildOffstageNavigator(item, item == selectedItem),
                  ),
                )
                .values
                .toList(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: BottomNavItem.values.indexOf(selectedItem),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            final currentSelectedItem = BottomNavItem.values[index];
            if (selectedItem == currentSelectedItem) {
              navigatorKeys[selectedItem]
                  ?.currentState
                  ?.popUntil((route) => route.isFirst);
            }
            setState(() {
              selectedItem = currentSelectedItem;
            });
          },
          items: items
              .map((item, icon) => MapEntry(
                  item.toString(),
                  BottomNavigationBarItem(
                      label: '',
                      icon: Icon(
                        icon,
                        size: 30.0,
                      ))))
              .values
              .toList(),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.search), label: 'explore'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.add_box_outlined), label: 'add'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.favorite_border), label: 'favorite'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.person), label: 'profile'),
        //   ],
        // ),
      ),
    );
  }

  Widget _buildOffstageNavigator(BottomNavItem currentItem, bool isSelected) {
    return Offstage(
      offstage: !isSelected,
      child: TabNavigator(
        navigatorKey: navigatorKeys[currentItem]!,
        item: currentItem,
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = '/';

  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavItem item;

  const TabNavigator({Key? key, required this.navigatorKey, required this.item})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilder();
    return Navigator(
      key: navigatorKey,
      initialRoute: tabNavigatorRoot,
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(
              settings: const RouteSettings(name: tabNavigatorRoot),
              builder: (context) => routeBuilders[initialRoute]!(context))
        ];
      },
      onGenerateRoute: CustomRouter.onGenerateNestedRoute,
    );
  }

  Map<String, WidgetBuilder> _routeBuilder() {
    return {tabNavigatorRoot: (context) => _getScreen(context, item)};
  }

  _getScreen(BuildContext context, BottomNavItem item) {
    switch (item) {
      case BottomNavItem.one:
        return Center(child: const Text('dkjnkjxbcjh'));
      case BottomNavItem.two:
        return Center(child: const Text('fff'));
      case BottomNavItem.three:
        return Center(child: const Text('000000'));
      // default:
      //   return Center(child: const Text('000hiuguyggfdsss567888888'));
    }
  }
}

enum BottomNavItem {
  one,
  two,
  three,
}

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/'),
            builder: (_) => const Scaffold());

      case RoutePaths.Splash:
        return CupertinoPageRoute(
            builder: (context) => const SavedScreen(),
            settings: RouteSettings(
                name: RoutePaths.Splash, arguments: settings.arguments));

      case RoutePaths.Home:
        return CupertinoPageRoute(
            builder: (context) => SavedScreen(),
            settings: const RouteSettings(name: RoutePaths.Home));

      default:
        return _errorRoute();
    }
  }

  static Route onGenerateNestedRoute(RouteSettings settings) {
    print('Nested Route: ${settings.name}');
    // this is where you define the nested routes.
    switch (settings.name) {
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong'),
        ),
      ),
    );
  }
}

class RoutePaths {
  static const String Splash = '/saved_screen';
  static const String Home = '/saved_screen';
}
