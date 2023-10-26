import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';

import '../../../book_summary/domain/entities/local_book.dart';
import '../../../book_summary/presentation/bloc/book_summary_bloc.dart';
import '../../../book_summary/presentation/widgets/summary_card.dart';
import '../../../delete_book/presentation/bloc/delete_books_bloc.dart';
import 'book_cover.dart';
import 'swipeable_card.dart';

final class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteBooksBloc, DeleteBooksState>(
      builder: (context, state) {
        final booksToDelete = state.deletionList;
        return GestureDetector(
          onLongPress: () => _switchToDeleteMode(context),
          onDoubleTap: () => context.toggleSummaryMode(book),
          onTap: () => _toggleModes(booksToDelete, context),
          child: _bookCard(booksToDelete),
        );
      },
    );
  }

  void _switchToDeleteMode(BuildContext context) {
    context.appendToDeleteList(book);
    Vibration.vibrate(duration: 100);
  }

  void _toggleModes(List<LocalBook> booksToDelete, BuildContext context) {
    context.disableSummaryMode();
    if (booksToDelete.isEmpty) return; // not in delete mode
    if (booksToDelete.contains(book)) {
      context.removeFromDeleteList(book);
      return;
    }
    context.appendToDeleteList(book);
  }

  Widget _bookCard(List<LocalBook> booksToDelete) {
    if (booksToDelete.isNotEmpty) return _DeletableCard(book: book);
    return BlocBuilder<BookSummaryBloc, BookSummaryState>(
      builder: (context, state) {
        final isInSummaryMode = state.bookInSummaryMode
            .map((b) => book == b)
            .getOrElse(() => false);
        if (isInSummaryMode) return SummaryCard(book: book);
        return SwipeableCard(
          book: book,
          child: BookCover(book: book),
        );
      },
    );
  }
}

final class _DeletableCard extends StatelessWidget {
  const _DeletableCard({required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: const [ShakeEffect(rotation: 0.01, hz: 2.5)],
      child: SwipeableCard(
        book: book,
        child: BlocBuilder<DeleteBooksBloc, DeleteBooksState>(
          builder: (context, state) {
            final isOnDeleteList = state.deletionList.contains(book);
            return Blur(
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
            );
          },
        ),
      ),
    );
  }
}
