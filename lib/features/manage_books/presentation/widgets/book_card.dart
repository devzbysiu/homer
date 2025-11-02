part of 'books_list.dart';

final class _BookCard extends StatelessBusWidget {
  _BookCard({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DeleteBooksBloc, DeleteBooksState, List<Book>>(
      selector: (state) => state.deletionListOrEmpty,
      builder: (context, booksToDelete) {
        return GestureDetector(
          onLongPress: () => _switchToDeleteMode(context),
          onDoubleTap: () => fire($SummaryModeToggled(book: book)),
          onTap: () => _toggleModes(booksToDelete, context),
          child: _bookCard(booksToDelete),
        );
      },
    );
  }

  void _switchToDeleteMode(BuildContext context) {
    fire($DeleteModeToggled(book: book));
    Vibration.vibrate(duration: 100);
  }

  void _toggleModes(List<Book> booksToDelete, BuildContext context) {
    fire($SummaryModeClosing()); // always disable summary mode on tap
    if (booksToDelete.isEmpty) return; // not in delete mode
    fire($DeleteModeToggled(book: book));
  }

  Widget _bookCard(List<Book> booksToDelete) {
    if (booksToDelete.isNotEmpty) return _DeletableCard(book: book);
    return BlocBuilder<BookSummaryBloc, BookSummaryState>(
      builder: (context, state) {
        switch (state.mode) {
          case SummaryMode.enabled:
            return _isInSummaryMode(state.current)
                ? _AnimatedSummaryCard(book: book)
                : _RegularCard(book: book);
          case SummaryMode.disabling:
            return _wasInSummaryMode(state.previous)
                ? _AnimatedRegularCard(book: book)
                : _RegularCard(book: book);
          default:
            return _RegularCard(book: book);
        }
      },
    );
  }

  bool _isInSummaryMode(dartz.Option<Book> current) {
    return current
        .map((bookInSummaryMode) => book == bookInSummaryMode)
        .getOrElse(() => false);
  }

  bool _wasInSummaryMode(dartz.Option<Book> previous) {
    return previous
        .map((wasInSummaryMode) => book == wasInSummaryMode)
        .getOrElse(() => false);
  }
}
