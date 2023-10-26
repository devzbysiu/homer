import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../navigation/presentation/widgets/bottom_sheet_content.dart';
import '../bloc/book_search_bloc.dart';
import 'search_suggestions.dart';

final class BookSearchArea extends StatefulWidget {
  const BookSearchArea({super.key});

  @override
  State<BookSearchArea> createState() => _BookSearchAreaState();
}

class _BookSearchAreaState extends State<BookSearchArea> {
  final FloatingSearchBarController _controller = FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookSearchBloc, BookSearchState>(
      builder: (context, state) {
        if (state is BookPicked) _controller.close();
        return FloatingSearchBar(
          accentColor: Theme.of(context).primaryColor,
          progress: state.isSearchInProgress,
          controller: _controller,
          body: const BottomSheetContent(),
          backgroundColor: Theme.of(context).colorScheme.background.lighten(10),
          backdropColor: Colors.transparent,
          hint: 'Search...',
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 600),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          axisAlignment: 0.0,
          openAxisAlignment: 0.0,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) => context.initiateSearch(query),
          transition: CircularFloatingSearchBarTransition(),
          actions: _actions(),
          builder: _suggestionsBuilder,
        );
      },
    );
  }

  List<Widget> _actions() {
    return [
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];
  }

  Widget _suggestionsBuilder(_, __) {
    return const SearchSuggestions();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
