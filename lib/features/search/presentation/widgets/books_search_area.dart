import 'package:event_bus/event_bus.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../injection_container.dart';
import '../../../navigation/presentation/widgets/bottom_sheet_content.dart';
import '../bloc/search_for_books_bloc.dart';
import 'search_suggestions.dart';

final class BookSearchArea extends StatelessWidget {
  BookSearchArea({super.key});

  final FloatingSearchBarController _controller = FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    _closeSuggestionsWhenBookPicked();
    final searchStarted = context.searchInProgress();
    return FloatingSearchBar(
      accentColor: Theme.of(context).primaryColor,
      progress: searchStarted,
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
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];
  }

  Widget _suggestionsBuilder(_, __) {
    return const SearchSuggestions();
  }

  void _closeSuggestionsWhenBookPicked() {
    // TODO: Fix it - remove the bus, use the state
    sl<EventBus>().on<CloseSuggestions>().listen((_) {
      _controller.close();
    });
  }
}
