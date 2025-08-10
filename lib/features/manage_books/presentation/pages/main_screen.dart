import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/utils/theme.dart';
import '../bloc/listing/books_event.dart';
import '../widgets/books_list.dart';

final class MainScreen extends StatefulBusWidget {
  MainScreen({super.key, super.bus});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final class _MainScreenState extends State<MainScreen> {
  final _searchController = FloatingSearchBarController();

  bool isSearchInProgress = false;

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: _searchController,
      transitionDuration: const Duration(milliseconds: 0),
      clearQueryOnClose: false,
      onQueryChanged: (query) => _onQueryChanged(query),
      actions: _clearOrSearchIcon(),
      leadingActions: _openDrawerIcon(context),
      backgroundColor: context.background,
      hint: 'Filter...',
      body: _booksListing(context),
      builder: (_, _) => Container(),
    );
  }

  void _onQueryChanged(String query) {
    setState(() {
      isSearchInProgress = query.isNotEmpty;
    });
    widget.fire(BooksFiltered(query));
  }

  List<Widget> _clearOrSearchIcon() {
    return [
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
    ];
  }

  void _clearQuery() {
    _searchController.clear();
    setState(() {});
  }

  List<Widget> _openDrawerIcon(BuildContext context) {
    return [
      IconButton(
        onPressed: () => ZoomDrawer.of(context)!.open(),
        icon: const Icon(Icons.menu),
      ),
    ];
  }

  IndexedStack _booksListing(BuildContext context) {
    return IndexedStack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [context.primaryContainer, context.lightPrimaryContainer],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 52),
            child: BooksList(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}
