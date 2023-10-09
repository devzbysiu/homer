import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vibration/vibration.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/image_card.dart';
import '../../domain/entities/local_book.dart';
import '../bloc/books_bloc.dart';
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
              child: _imageCard(book),
            ),
    );
  }

  void _switchToDeleteMode(BuildContext context) {
    context.emitBooksEvt(AppendToDeleteList(book));
    Vibration.vibrate(duration: 100);
  }

  void _toggleDeletion(List<LocalBook> booksToDelete, BuildContext context) {
    if (booksToDelete.isEmpty) {
      return;
    }
    final selectedToDelete = booksToDelete.contains(book);
    if (selectedToDelete) {
      context.emitBooksEvt(RemoveFromDeleteList(book));
      return;
    }
    context.emitBooksEvt(AppendToDeleteList(book));
  }
}

Widget _imageCard(LocalBook book) {
  return ImageCard(
    title: book.title,
    authors: book.authors,
    rating: book.rating,
    pageCount: book.pageCount,
    tags: book.tags,
    thumbnailAddress: book.thumbnailAddress,
  );
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
                ? const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 35,
                  )
                : null,
          ),
          blurColor: Colors.red,
          child: _imageCard(book),
        ),
      ),
    );
  }
}
