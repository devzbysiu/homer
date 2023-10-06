import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:vibration/vibration.dart';

import '../../../../core/utils/color_mapper.dart';
import '../../../../core/utils/extensions.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../../domain/entities/book.dart';
import '../bloc/books_bloc.dart';
import 'swipeable_card.dart';

final class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final booksToDelete = context.booksToDelete();
    final selectedToDelete = booksToDelete.contains(book);
    return GestureDetector(
      onLongPress: () => _pickForDeletion(context),
      onTap: () => _appendToDeletion(selectedToDelete, context),
      child: booksToDelete.isNotEmpty
          ? SwipeableCard(
              book: book,
              child: Blur(
                colorOpacity: selectedToDelete ? 0.8 : 0.5,
                blur: 1.0,
                overlay: Center(
                  child: selectedToDelete ? const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 35,
                  ) : null,
                ),
                blurColor: Colors.red,
                child: TransparentImageCard(
                  imageProvider: _imageProvider() as ImageProvider<Object>,
                  tags: _tags(),
                  title: _BookTitle(title: book.title),
                  description: _BookAuthor(authorName: book.author),
                  footer: _BookCardFooter(book: book),
                ),
              ),
            )
          : SwipeableCard(
              book: book,
              child: TransparentImageCard(
                imageProvider: _imageProvider() as ImageProvider<Object>,
                tags: _tags(),
                title: _BookTitle(title: book.title),
                description: _BookAuthor(authorName: book.author),
                footer: _BookCardFooter(book: book),
              ),
            ),
    );
  }

  List<Widget> _tags() {
    return book.tags.map((tag) => _Tag(tag: tag)).toList();
  }

  Object _imageProvider() {
    return book.thumbnailAddress == null
        ? const AssetImage('assets/book-cover-fallback.webp')
        : CachedNetworkImageProvider(book.thumbnailAddress!);
  }

  void _pickForDeletion(BuildContext context) {
    context.emitBooksEvt(AppendToDeleteList(book));
    Vibration.vibrate(duration: 100);
  }

  void _appendToDeletion(bool selectedToDelete, BuildContext context) {
    if (selectedToDelete) {
      context.emitBooksEvt(RemoveFromDeleteList(book));
      return;
    }
    context.emitBooksEvt(AppendToDeleteList(book));
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

  final Book book;

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

final class _Tag extends StatelessWidget {
  const _Tag({required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: toFlutterColor(tag.color),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        child: Text(
          tag.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
