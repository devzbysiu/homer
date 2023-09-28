import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/repository/book_repository.dart';
import 'package:homer/core/utils/bloc_extensions.dart';
import 'package:homer/feature/book/widget/book_card.dart';
import 'package:homer/feature/navigation/bloc/app_tab_bloc.dart';
import 'package:homer/main.dart';

class BooksList extends StatelessWidget {
  BooksList({super.key});

  final BookRepository _bookRepo = getIt<BookRepository>();

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
        return _bookRepo.findAllForLater();
      case AppTab.reading:
        return _bookRepo.findAllReading();
      case AppTab.read:
        return _bookRepo.findAllRead();
    }
  }
}
