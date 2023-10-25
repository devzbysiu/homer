part of 'book_summary_bloc.dart';

@immutable
abstract class BookSummaryState extends Equatable {
  const BookSummaryState({
    this.bookInSummaryMode = const None(),
  });

  final Option<LocalBook> bookInSummaryMode;

  @override
  List<Object> get props => [bookInSummaryMode];
}

final class Empty extends BookSummaryState {}

final class EnableSummaryMode extends BookSummaryState {
  const EnableSummaryMode({required super.bookInSummaryMode});
}

final class DisableSummaryMode extends BookSummaryState {}
