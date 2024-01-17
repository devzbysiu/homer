part of 'book_summary_bloc.dart';

final class BookSummaryState extends Equatable {
  const BookSummaryState({
    required this.current,
    required this.previous,
    required this.value,
  });

  const BookSummaryState.initial()
      : current = const None(),
        previous = const None(),
        value = SummaryMode.initial;

  BookSummaryState.enabled(Book book)
      : current = some(book),
        previous = const None(),
        value = SummaryMode.enabled;

  const BookSummaryState.disabled()
      : current = const None(),
        previous = const None(),
        value = SummaryMode.disabled;

  const BookSummaryState.disabling(Option<Book> current)
      : current = const None(),
        previous = current,
        value = SummaryMode.disabling;

  final Option<Book> current;

  final Option<Book> previous;

  final SummaryMode value;

  @override
  List<Object> get props => [current, previous, value];
}

enum SummaryMode {
  initial,
  enabled,
  disabled,
  disabling,
}
