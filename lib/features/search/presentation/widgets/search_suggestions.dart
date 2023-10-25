import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/book_search_bloc.dart';
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
            child: BlocBuilder<BookSearchBloc, BookSearchState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _searchSuggestions(state),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _searchSuggestions(BookSearchState state) {
    return state.foundBooks.map((book) {
      return SearchSuggestion(book: book);
    }).toList();
  }
}
