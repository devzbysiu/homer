import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/book_search_context_ext.dart';
import '../../../../core/utils/extensions/books_context_ext.dart';
import '../../../../core/utils/extensions/on_book_tags_context_ext.dart';
import '../../../books_listing/domain/entities/local_book.dart';
import '../../../search/domain/entities/remote_book.dart';

final class SaveButtons extends StatelessWidget {
  const SaveButtons({super.key, required this.pickedBook});

  final RemoteBook pickedBook;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () => _addBook(
            context,
            pickedBook,
            LocalBookState.readLater,
          ),
          color: Theme.of(context).colorScheme.secondary,
          icon: const Icon(Icons.bookmark),
        ),
        IconButton(
          onPressed: () => _addBook(
            context,
            pickedBook,
            LocalBookState.reading,
          ),
          color: Theme.of(context).colorScheme.secondary,
          icon: const Icon(Icons.book),
        ),
        IconButton(
          onPressed: () => _addBook(
            context,
            pickedBook,
            LocalBookState.read,
          ),
          color: Theme.of(context).colorScheme.secondary,
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }

  void _addBook(
    BuildContext context,
    RemoteBook pickedBook,
    LocalBookState bookState,
  ) {
    final selectedTags = context.selectedTags();
    context.addBook(pickedBook, bookState, selectedTags);
    context.clearPickedBook();
    context.clearSelectedTags();
  }
}
