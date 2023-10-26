part of 'book_summary_bloc.dart';

@immutable
abstract class BookSummaryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SummaryModeDisabled extends BookSummaryEvent {}

final class SummaryModeToggled extends BookSummaryEvent {
  SummaryModeToggled(this.book);

  final LocalBook book;
}
