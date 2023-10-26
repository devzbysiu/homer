import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/remote_book.dart';
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
            child: const _SearchSuggestions(),
          ),
        ),
      ),
    );
  }
}

class _SearchSuggestions extends StatelessWidget {
  const _SearchSuggestions();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookSearchBloc, BookSearchState, List<RemoteBook>>(
      selector: (state) => state.foundBooks,
      builder: (context, foundBooks) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: _searchSuggestions(foundBooks),
        );
      },
    );
  }

  List<Widget> _searchSuggestions(List<RemoteBook> foundBooks) {
    return foundBooks.map((book) {
      return SearchSuggestion(book: book);
    }).toList();
  }
}
