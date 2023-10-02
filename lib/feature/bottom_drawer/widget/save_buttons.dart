import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/use_case/change_book_tags/book_tags_bloc.dart';
import 'package:homer/core/book/domain/use_case/list_books/books_bloc.dart';
import 'package:homer/core/utils/extensions.dart';

class SaveButtons extends StatelessWidget {
  const SaveButtons({super.key, required this.pickedBook});

  final BookEntity pickedBook;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () => _addBook(
            context,
            pickedBook,
            BookState.readLater,
          ),
          color: Colors.green,
          icon: const Icon(Icons.bookmark),
        ),
        IconButton(
          onPressed: () => _addBook(
            context,
            pickedBook,
            BookState.reading,
          ),
          color: Colors.blue,
          icon: const Icon(Icons.book),
        ),
        IconButton(
          onPressed: () => _addBook(
            context,
            pickedBook,
            BookState.read,
          ),
          color: Colors.amber,
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }

  void _addBook(
    BuildContext context,
    BookEntity pickedBook,
    BookState bookState,
  ) {
    final selectedTags = context.selectedTags();
    context.emitBooksEvt(BookAdded(pickedBook.copyWith(
      state: bookState,
      tags: selectedTags,
    )));
    context.emitBookTagsEvt(ClearSelectedTags());
  }
}
