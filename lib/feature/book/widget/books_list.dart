import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homer/core/utils/bloc_extensions.dart';
import 'package:homer/feature/book/widget/book_card.dart';

class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.booksOfCurrentTab();
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
