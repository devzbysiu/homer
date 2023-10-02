import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/use_case/display_suggested_book/suggested_book_bloc.dart';
import 'package:homer/core/book/domain/use_case/search_for_books/search_for_books_bloc.dart';
import 'package:homer/core/utils/extensions.dart';
import 'package:homer/feature/bottom_drawer/widget/bottom_sheet_content.dart';
import 'package:homer/feature/search/widget/search_suggestions.dart';
import 'package:homer/main.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

final class BookSearchArea extends StatelessWidget {
  BookSearchArea({super.key});

  final FloatingSearchBarController _controller = FloatingSearchBarController();
  
  @override
  Widget build(BuildContext context) {
    _closeSuggestionsWhenBookPicked();
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
      onQueryChanged: (query) => _onQueryChanged(context, query),
      transition: CircularFloatingSearchBarTransition(),
      actions: _actions(),
      builder: _suggestionsBuilder,
    );
  }

  void _onQueryChanged(BuildContext context, String query) {
    context.emitSearchForBooksEvt(SearchInitiated(query));
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
    return const SearchSuggestions();
  }

  void _closeSuggestionsWhenBookPicked() {
    getIt<EventBus>().on<BookPicked>().listen((_) {
      _controller.close();
    });
  }
}
