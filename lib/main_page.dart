import 'package:flutter/material.dart';
import 'package:mini_insta/explore_screen.dart';
import 'package:mini_insta/saved_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  bool visible = true;
  List<Widget> pageList = const [
    SavedScreen(),
    SavedScreen(),
    ExploreScreen(),
    SavedScreen(),
    SavedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.pink,
        currentIndex: pageIndex,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black26,
        unselectedFontSize: 20,
        elevation: 5,
        backgroundColor: Colors.grey[100],
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home_filled),
              icon: Icon(
                Icons.home,
              ),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.account_circle_rounded),
              icon: Icon(
                Icons.person,
              ),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.search_outlined,
              ),
              icon: Icon(
                Icons.search,
              ),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.add_box,
              ),
              icon: Icon(
                Icons.add_box_outlined,
              ),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite_outlined,
              ),
              icon: Icon(
                Icons.favorite_border,
              ),
              label: ""),
        ],
      ),
    );
  }
}
