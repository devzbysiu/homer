import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';

import '../../../search/domain/entities/remote_book.dart';
import 'remote_book_card.dart';

final class BookWithSummary extends StatelessWidget {
  const BookWithSummary({super.key, required this.pickedBook});

  final RemoteBook pickedBook;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 9, right: 9),
      child: DropCapText(
        pickedBook.description,
        maxLines: 23,
        overflow: TextOverflow.ellipsis,
        dropCap: DropCap(
          width: 200,
          height: 280,
          child: RemoteBookCard(book: pickedBook),
        ),
        dropCapPadding: const EdgeInsets.only(
          bottom: 5,
          right: 15,
        ),
      ),
    );
  }
}
