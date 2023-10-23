import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../core/utils/extensions/books_context_ext.dart';
import '../../../../core/utils/extensions/delete_books_context_ext.dart';
import '../../../delete_book/presentation/bloc/delete_books_bloc.dart';
import '../../../navigation/presentation/bloc/app_tab_bloc.dart';
import 'book_card.dart';

final class BooksList extends StatefulWidget {
  const BooksList({super.key});

  @override
  State<BooksList> createState() => _BooksListState();
}

final class _BooksListState extends State<BooksList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final books = context.booksOfCurrentTab();
    if (books.isEmpty) return Container();

    return MultiBlocListener(
      listeners: [
        _refreshWhenBooksRemoved(),
        _jumpToTopOnTabChange(),
      ],
      child: GestureDetector(
        onTap: () => context.clearDeletionList(),
        child: FloatingSearchBarScrollNotifier(
          child: AlignedGridView.count(
            controller: _scrollController,
            crossAxisCount: 2,
            cacheExtent: 0,
            itemCount: books.length,
            itemBuilder: (context, index) => BookCard(book: books[index]),
          ),
        ),
      ),
    );
  }

  BlocListener _refreshWhenBooksRemoved() {
    return BlocListener<DeleteBooksBloc, DeleteBooksState>(
      listener: (_, state) {
        if (state is BooksRemoved) context.refreshBooksList();
      },
    );
  }

  BlocListener _jumpToTopOnTabChange() {
    return BlocListener<AppTabBloc, AppTabState>(
      listener: (_, state) {
        if (state is AppTabState) _scrollController.jumpTo(0);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
