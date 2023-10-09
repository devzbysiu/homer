import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

import '../../domain/entities/remote_book.dart';

final class RemoteBookCard extends StatelessWidget {
  const RemoteBookCard({super.key, required this.book});

  final RemoteBook book;

  @override
  Widget build(BuildContext context) {
    // TODO: This _ImageCard should probably be RemoteBookCard
    return _ImageCard(book: book);
  }
}

final class _BookTitle extends StatelessWidget {
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

final class _BookAuthor extends StatelessWidget {
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

final class _BookCardFooter extends StatelessWidget {
  const _BookCardFooter({required this.book});

  final RemoteBook book;

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
            book.averageRating.toStringAsFixed(2),
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

class _ImageCard extends StatelessWidget {
  const _ImageCard({required this.book});

  final RemoteBook book;

  @override
  Widget build(BuildContext context) {
    return TransparentImageCard(
      imageProvider: _imageProvider() as ImageProvider<Object>,
      tags: const [],
      title: _BookTitle(title: book.title),
      description: _BookAuthor(authorName: book.authors[0]),
      // TODO: take care of that
      footer: _BookCardFooter(book: book),
    );
  }

  Object _imageProvider() {
    return CachedNetworkImageProvider(
        book.imageLinks.values.first.toString()); // TODO: Take care of this
  }
}
