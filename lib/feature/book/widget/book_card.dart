import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
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
        title: _BookTitle(title: book.title),
        description: _BookAuthor(authorName: book.author),
        footer: _BookCardFooter(book: book),
      ),
    );
  }

  List<Widget> _labels() {
    return book.labels.map((b) => _Label(label: b)).toList();
  }
}

class _BookTitle extends StatelessWidget {
  const _BookTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _BookAuthor extends StatelessWidget {
  const _BookAuthor({required this.authorName});

  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Text(
      authorName,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}

class _BookCardFooter extends StatelessWidget {
  const _BookCardFooter({required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            book.rating.toStringAsFixed(2),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Text(
          book.pageCount.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
        ),
        const Icon(
          Icons.menu_book_outlined,
          color: Colors.white,
        )
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({required this.label});

  final BookLabel label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.green,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        child: Text(
          label.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
