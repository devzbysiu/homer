import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homer/core/book/domain/repository/book_repository.dart';
import 'package:homer/feature/book/widget/book_card.dart';
import 'package:homer/main.dart';

class BooksList extends StatelessWidget {
  BooksList({super.key});

  final BookRepository _bookRepo = getIt<BookRepository>();

  @override
  Widget build(BuildContext context) {
    final books = _bookRepo.findAll();
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
}
