import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/book_search_context_ext.dart';
import 'search_suggestion.dart';

final class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 470 - MediaQuery.of(context).viewInsets.bottom,
      child: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Theme.of(context).listTileTheme.tileColor,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _searchSuggestions(context),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _searchSuggestions(BuildContext context) {
    return context.foundBooks().map((book) {
      return SearchSuggestion(book: book);
    }).toList();
  }
}
