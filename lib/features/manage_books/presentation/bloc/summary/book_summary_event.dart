part of 'book_summary_bloc.dart';

@immutable
abstract class BookSummaryEvent extends Equatable implements BusEvent {
  @override
  List<Object> get props => [];
}

final class SummaryModeClosing extends BookSummaryEvent {}

final class SummaryModeToggled extends BookSummaryEvent {
  SummaryModeToggled(this.book);

  final Book book;
}

final class SummaryModeClosed extends BookSummaryEvent {}
