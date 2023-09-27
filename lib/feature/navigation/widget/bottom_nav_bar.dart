import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/feature/navigation/bloc/app_tab_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final tab = context.select((AppTabBloc bloc) => bloc.state.currentTab);
    return DotNavigationBar(
      margin: const EdgeInsets.only(left: 10, right: 10),
      currentIndex: AppTab.values.indexOf(tab),
      dotIndicatorColor: Colors.white,
      unselectedItemColor: Colors.grey[300],
      splashBorderRadius: 50,
      onTap: (idx) => _handleIndexChanged(idx, context),
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

  void _handleIndexChanged(int i, BuildContext context) {
    context.read<AppTabBloc>().add(TabChanged(AppTab.values[i]));
  }
}

enum _SelectedTab { home, favorite, search, person }
