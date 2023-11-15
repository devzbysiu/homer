part of 'book_summary_bloc.dart';

@immutable
abstract class BookSummaryState extends Equatable {
  const BookSummaryState({
    this.bookInSummaryMode = const None(),
    this.wasInSummaryMode = const None(),
  });

  final Option<Book> bookInSummaryMode;

  final Option<Book> wasInSummaryMode;

  @override
  List<Object> get props => [bookInSummaryMode];
}

final class Empty extends BookSummaryState {}

final class EnableSummaryMode extends BookSummaryState {
  const EnableSummaryMode({required super.bookInSummaryMode});
}

final class DisablingSummaryMode extends BookSummaryState {
  const DisablingSummaryMode({required super.wasInSummaryMode});
}

final class DisabledSummaryMode extends BookSummaryState {}
