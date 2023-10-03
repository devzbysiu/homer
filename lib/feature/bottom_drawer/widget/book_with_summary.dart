import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';

import '../../../core/book/domain/entity/book_entity.dart';
import '../../book/widget/book_card.dart';

class BookWithSummary extends StatelessWidget {
  const BookWithSummary({super.key, required this.pickedBook});

  final BookEntity pickedBook;

  @override
  Widget build(BuildContext context) {
    return DropCapText(
      pickedBook.summary ?? '',
      indentation: const Offset(0, 8),
      maxLines: 25,
      overflow: TextOverflow.ellipsis,
      dropCap: DropCap(
        width: 200,
        height: 300,
        child: BookCard(book: pickedBook),
      ),
    );
  }
}
