import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/core/utils/extensions.dart';
import 'package:homer/core/book/domain/use_case/app_tab/app_tab_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = context.figureOutColor();
    return CurvedNavigationBar(
      backgroundColor: backgroundColor,
      items: const [
        CurvedNavigationBarItem(
          child: Icon(Icons.bookmark, color: Colors.green),
          label: 'Read Later',
        ),
        CurvedNavigationBarItem(
          child: Icon(Icons.book, color: Colors.blue),
          label: 'Reading',
        ),
        CurvedNavigationBarItem(
          child: Icon(Icons.done, color: Colors.amber),
          label: 'Read',
        ),
      ],
      onTap: (idx) => _handleIndexChanged(idx, context),
    );
  }

  void _handleIndexChanged(int i, BuildContext context) {
    context.read<AppTabBloc>().add(TabChanged(AppTab.values[i]));
  }
}
