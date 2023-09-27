import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/feature/book/widget/book_author.dart';
import 'package:homer/feature/book/widget/book_title.dart';
import 'package:homer/feature/book/widget/card_footer.dart';
import 'package:homer/feature/book/widget/label.dart';
import 'package:homer/feature/book/widget/swipeable_card.dart';
import 'package:image_card/image_card.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return SwipeableCard(
      child: TransparentImageCard(
        imageProvider: NetworkImage(
          book.thumbnailAddress ??
              'https://covers.openlibrary.org/b/isbn/9780385533225-M.jpg',
        ),
        tags: _labels(),
        title: BookTitle(title: book.title),
        description: BookAuthor(authorName: book.author),
        footer: BookCardFooter(book: book),
      ),
    );
  }

  List<Widget> _labels() {
    return book.labels.map((b) => Label(label: b)).toList();
  }
}
