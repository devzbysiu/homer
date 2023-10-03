import 'package:flutter/material.dart';

import '../../../core/utils/extensions.dart';
import 'search_suggestion.dart';

final class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: Colors.white,
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _searchSuggestions(context),
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
