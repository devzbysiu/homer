import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../widgets/books_list.dart';

final class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      leadingActions: [
        IconButton(
          onPressed: () => ZoomDrawer.of(context)!.open(),
          icon: const Icon(Icons.menu),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      hint: 'Filter...',
      body: IndexedStack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.lighten(15),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60),
              child: BooksList(),
            ),
          )
        ],
      ),
      builder: (_, __) => const Placeholder(),
    );
  }
}
