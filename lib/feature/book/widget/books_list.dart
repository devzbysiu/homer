import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/utils/bloc_extensions.dart';
import 'package:homer/feature/book/controller/books_list_controller.dart';
import 'package:homer/feature/book/widget/book_card.dart';
import 'package:homer/feature/navigation/bloc/app_tab_bloc.dart';
import 'package:homer/main.dart';

class BooksList extends StatelessWidget {
  BooksList({super.key, BooksListController? controller}) {
    _controller = controller ?? getIt<BooksListController>();
  }

  late final BooksListController _controller;

  @override
  Widget build(BuildContext context) {
    final books = _findBooks(context.currentTab());
    return AlignedGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      itemBuilder: (context, index) {
        if (index >= books.length) return null;
        return BookCard(book: books[index]);
      },
    );
  }

  List<BookEntity> _findBooks(AppTab onTab) {
    switch (onTab) {
      case AppTab.readLater:
        return _controller.getBooks(BookState.readLater);
      case AppTab.reading:
        return _controller.getBooks(BookState.reading);
      case AppTab.read:
        return _controller.getBooks(BookState.read);
    }
  }
}
