import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
      margin: const EdgeInsets.only(left: 10, right: 10),
      currentIndex: _SelectedTab.values.indexOf(_selectedTab),
      dotIndicatorColor: Colors.white,
      unselectedItemColor: Colors.grey[300],
      splashBorderRadius: 50,
      onTap: _handleIndexChanged,
      items: [
        DotNavigationBarItem(
          icon: const Icon(Icons.bookmark),
          selectedColor: Colors.green,
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.book),
          selectedColor: Colors.blue,
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.done),
          selectedColor: Colors.amber,
        ),
      ],
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
