part of 'books_list.dart';

final class _BookCard extends StatelessWidget {
  const _BookCard({required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DeleteBooksBloc, DeleteBooksState, List<LocalBook>>(
      selector: (state) => state.deletionList,
      builder: (context, booksToDelete) {
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
    context.toggleBookOnDeleteList(book);
    Vibration.vibrate(duration: 100);
  }

  void _toggleModes(List<LocalBook> booksToDelete, BuildContext context) {
    context.disableSummaryMode(); // always disable summary mode on toggle
    if (booksToDelete.isEmpty) return; // not in delete mode
    context.toggleBookOnDeleteList(book);
  }

  Widget _bookCard(List<LocalBook> booksToDelete) {
    if (booksToDelete.isNotEmpty) return _DeletableCard(book: book);
    return BlocSelector<BookSummaryBloc, BookSummaryState, bool>(
      selector: (state) => state.bookInSummaryMode
          .map((bookInSummaryMode) => book == bookInSummaryMode)
          .getOrElse(() => false),
      builder: (context, isInSummaryMode) {
        if (isInSummaryMode) return _SummaryCard(book: book);
        return _SwipeableCard(
          book: book,
          child: _BookCover(book: book),
        );
      },
    );
  }
}
