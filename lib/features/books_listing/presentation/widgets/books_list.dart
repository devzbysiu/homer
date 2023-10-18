import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../core/utils/extensions/books_context_ext.dart';
import 'book_card.dart';

final class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.booksOfCurrentTab();
    if (books.isEmpty) {
      return Container();
    }
    return GestureDetector(
      onTap: () => _disableDeleteMode(context),
      child: FloatingSearchBarScrollNotifier(
        child: AlignedGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          itemCount: books.length,
          itemBuilder: (context, index) {
            return BookCard(book: books[index]).animate().flip();
          },
        ),
      ),
    );
  }

  void _disableDeleteMode(BuildContext context) {
    context.clearDeletionList();
  }
}
