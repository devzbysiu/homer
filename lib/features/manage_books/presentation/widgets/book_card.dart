part of 'books_list.dart';

final class _BookCard extends StatelessWidget {
  const _BookCard({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DeleteBooksBloc, DeleteBooksState, List<Book>>(
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

  void _toggleModes(List<Book> booksToDelete, BuildContext context) {
    context.disableSummaryMode(); // always disable summary mode on toggle
    if (booksToDelete.isEmpty) return; // not in delete mode
    context.toggleBookOnDeleteList(book);
  }

  Widget _bookCard(List<Book> booksToDelete) {
    if (booksToDelete.isNotEmpty) return _DeletableCard(book: book);
    return BlocBuilder<BookSummaryBloc, BookSummaryState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case EnableSummaryMode:
            return _isInSummaryMode(state)
                ? _AnimatedSummaryCard(book: book)
                : _RegularCard(book: book);
          case DisablingSummaryMode:
            return _wasInSummaryMode(state)
                ? _AnimatedRegularCard(book: book, context: context)
                : _RegularCard(book: book);
          default:
            return _RegularCard(book: book);
        }
      },
    );
  }

  bool _isInSummaryMode(BookSummaryState state) {
    return state.bookInSummaryMode
        .map((bookInSummaryMode) => book == bookInSummaryMode)
        .getOrElse(() => false);
  }

  bool _wasInSummaryMode(BookSummaryState state) {
    return state.wasInSummaryMode
        .map((wasInSummaryMode) => book == wasInSummaryMode)
        .getOrElse(() => false);
  }
}
