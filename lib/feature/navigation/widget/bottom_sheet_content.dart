import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/use_case/list_books/books_bloc.dart';
import 'package:homer/core/utils/extensions.dart';
import 'package:homer/feature/book/widget/book_card.dart';

final class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final pickedBook = context.pickedSuggestedBook();
    return pickedBook == null
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Stack(
              children: [
                DropCapText(
                  pickedBook.summary!,
                  indentation: const Offset(0, 8),
                  maxLines: 25,
                  overflow: TextOverflow.ellipsis,
                  dropCap: DropCap(
                    width: 200,
                    height: 300,
                    child: BookCard(book: pickedBook),
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 10,
                  child: Row(
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
                  ),
                )
              ],
            ),
          );
  }

  void _addBook(
    BuildContext context,
    BookEntity pickedBook,
    BookState bookState,
  ) {
    context.emitBooksEvt(BookAdded(pickedBook.copyWith(state: bookState)));
  }
}
