import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../core/utils/extensions/books_context_ext.dart';
import '../../../../core/utils/extensions/delete_books_context_ext.dart';
import '../../../delete_book/presentation/bloc/delete_books_bloc.dart';
import 'book_card.dart';

final class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.booksOfCurrentTab();
    if (books.isEmpty) {
      return Container();
    }
    return BlocListener<DeleteBooksBloc, DeleteBooksState>(
      listener: (context, state) {
        if (state is BooksRemoved) context.refreshBooksList();
      },
      child: GestureDetector(
        onTap: () => context.clearDeletionList(),
        child: FloatingSearchBarScrollNotifier(
          child: AlignedGridView.count(
            crossAxisCount: 2,
            cacheExtent: 0,
            itemCount: books.length,
            itemBuilder: (context, index) => BookCard(book: books[index]),
          ),
        ),
      ),
    );
  }
}
