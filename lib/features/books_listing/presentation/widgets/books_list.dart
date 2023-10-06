import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/utils/extensions.dart';
import 'book_card.dart';

final class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.booksOfCurrentTab();
    if (books.isEmpty) {
      return Container();
    }
    return AlignedGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookCard(book: books[index]);
      },
    );
  }
}
