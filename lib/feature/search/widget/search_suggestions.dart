import 'package:flutter/material.dart';
import 'package:homer/core/utils/extensions.dart';
import 'package:homer/feature/search/widget/search_suggestion.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key, required this.controller});

  final FloatingSearchBarController controller;

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
      return SearchSuggestion(book: book, controller: controller);
    }).toList();
  }
}
