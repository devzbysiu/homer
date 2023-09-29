import 'package:flutter/material.dart';
import 'package:homer/feature/navigation/widget/bottom_sheet_content.dart';
import 'package:homer/feature/search/widget/search_suggestions.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class BooksSearchBar extends StatelessWidget {
  BooksSearchBar({super.key});

  final FloatingSearchBarController _controller = FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: _controller,
      body: const BottomSheetContent(),
      backdropColor: Colors.white,
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 400),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: 0.0,
      openAxisAlignment: 0.0,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {},
      transition: CircularFloatingSearchBarTransition(),
      actions: _actions(),
      builder: _suggestionsBuilder,
    );
  }

  List<Widget> _actions() {
    return [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: const Icon(Icons.book),
          onPressed: () {},
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];
  }

  Widget _suggestionsBuilder(_, __) {
    return SearchSuggestions(controller: _controller);
  }
}
