import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';
import '../../../books_listing/domain/entities/local_book.dart';
import '../../../books_listing/presentation/bloc/books_bloc.dart';
import '../../../search/domain/entities/remote_book.dart';
import '../../../search/presentation/bloc/search_for_books_bloc.dart';
import '../bloc/add_tags/book_tags_bloc.dart';

class SaveButtons extends StatelessWidget {
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
    RemoteBook pickedBook,
    BookState bookState,
  ) {
    final selectedTags = context.selectedTags();
    context.emitBooksEvt(BookAdded(pickedBook, bookState, selectedTags));
    context.emitSearchForBooksEvt(NoBookPicked());
    context.emitBookTagsEvt(ClearSelectedTags());
  }
}
