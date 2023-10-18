import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_card/image_card.dart';
import 'package:vibration/vibration.dart';

import '../../../../core/utils/color_mapper.dart';
import '../../../../core/utils/extensions/books_context_ext.dart';
import '../../../../core/utils/fallback_img.dart';
import '../../../../core/widgets/book_authors.dart';
import '../../../../core/widgets/book_title.dart';
import '../../../../core/widgets/card_footer.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../../domain/entities/local_book.dart';
import 'swipeable_card.dart';

final class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    final booksToDelete = context.booksToDelete();
    final isOnDeleteList = booksToDelete.contains(book);
    return GestureDetector(
      onLongPress: () => _switchToDeleteMode(context),
      onTap: () => _toggleDeletion(booksToDelete, context),
      child: booksToDelete.isNotEmpty
          ? _DeletableCard(
              book: book,
              isOnDeleteList: isOnDeleteList,
            )
          : SwipeableCard(
              book: book,
              child: _ImageCard(book: book),
            ),
    );
  }

  void _switchToDeleteMode(BuildContext context) {
    context.appendToDeleteList(book);
    Vibration.vibrate(duration: 100);
  }

  void _toggleDeletion(List<LocalBook> booksToDelete, BuildContext context) {
    if (booksToDelete.isEmpty) {
      return;
    }
    final selectedToDelete = booksToDelete.contains(book);
    if (selectedToDelete) {
      context.removeFromDeleteList(book);
      return;
    }
    context.appendToDeleteList(book);
  }
}

final class _DeletableCard extends StatelessWidget {
  const _DeletableCard({
    required this.book,
    required this.isOnDeleteList,
  });

  final LocalBook book;

  final bool isOnDeleteList;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: const [ShakeEffect(rotation: 0.01, hz: 2.5)],
      child: SwipeableCard(
        book: book,
        child: Blur(
          colorOpacity: isOnDeleteList ? 0.8 : 0.0,
          blur: 0.0,
          overlay: Center(
            child: isOnDeleteList
                ? Icon(
                    Icons.done,
                    color: Theme.of(context).iconTheme.color,
                    size: 35,
                  )
                : null,
          ),
          blurColor: Theme.of(context).colorScheme.error,
          child: _ImageCard(book: book),
        ),
      ),
    );
  }
}

final class _ImageCard extends StatelessWidget {
  const _ImageCard({required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return TransparentImageCard(
      imageProvider: _imageProvider() as ImageProvider<Object>,
      tags: _tags(),
      endColor: Colors.black,
      title: BookTitle(title: book.title),
      description: BookAuthors(authorNames: book.authors),
      footer: BookCardFooter(
        rating: book.rating,
        pageCount: book.pageCount,
      ),
    );
  }

  Object _imageProvider() {
    return book.thumbnailAddress.fold(
      () => coverFallbackAssetImage(),
      (thumbnailAddress) => CachedNetworkImageProvider(thumbnailAddress),
    );
  }

  List<Widget> _tags() {
    return book.tags.map((tag) => _Tag(tag: tag)).toList();
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
