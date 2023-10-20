import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:homer/core/utils/extensions/book_context_ext.dart';
import 'package:homer/core/utils/extensions/books_context_ext.dart';
import 'package:homer/features/book/presentation/widgets/summary_card.dart';
import 'package:vibration/vibration.dart';

import '../../../book/domain/entities/local_book.dart';
import 'book_cover.dart';
import 'swipeable_card.dart';

final class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    final booksToDelete = context.booksToDelete();
    final isOnDeleteList = booksToDelete.contains(book);
    final isInSummaryMode = context.isInSummaryMode(book);
    return GestureDetector(
      onLongPress: () => _switchToDeleteMode(context),
      onDoubleTap: () => _toggleSummaryMode(isInSummaryMode, context),
      onTap: () => _toggleModes(booksToDelete, context),
      child: _bookCard(booksToDelete, isOnDeleteList, isInSummaryMode),
    );
  }

  void _switchToDeleteMode(BuildContext context) {
    context.appendToDeleteList(book);
    Vibration.vibrate(duration: 100);
  }

  void _toggleSummaryMode(bool isInSummaryMode, BuildContext context) {
    isInSummaryMode ? context.disableSummaryMode() : context.showSummary(book);
  }

  void _toggleModes(List<LocalBook> booksToDelete, BuildContext context) {
    context.disableSummaryMode();
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

  Widget _bookCard(
    List<LocalBook> booksToDelete,
    bool isOnDeleteList,
    bool isInSummaryMode,
  ) {
    if (booksToDelete.isNotEmpty) {
      return _DeletableCard(
        book: book,
        isOnDeleteList: isOnDeleteList,
      );
    } else if (booksToDelete.isEmpty && !isInSummaryMode) {
      return SwipeableCard(
        book: book,
        child: BookCover(book: book),
      );
    } else if (isInSummaryMode) {
      return SummaryCard(book: book);
    }
    throw Exception('Should not happen');
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
          child: BookCover(book: book),
        ),
      ),
    );
  }
}
