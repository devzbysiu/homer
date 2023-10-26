import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../bloc/listing/books_bloc.dart';
import '../widgets/books_list.dart';

final class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _searchController = FloatingSearchBarController();

  bool isSearchInProgress = false;

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: _searchController,
      transitionDuration: const Duration(milliseconds: 0),
      clearQueryOnClose: false,
      onQueryChanged: (query) => _onQueryChanged(query),
      actions: [
        if (isSearchInProgress)
          IconButton(
            onPressed: () => _clearQuery(),
            icon: const Icon(Icons.close),
          ),
        if (!isSearchInProgress)
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search),
          ),
      ],
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
      builder: (_, __) => Container(),
    );
  }

  void _clearQuery() {
    _searchController.clear();
    setState(() {});
  }

  void _onQueryChanged(String query) {
    setState(() {
      isSearchInProgress = query.isNotEmpty;
    });
    context.filterBooks(query);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}
