part of 'suggested_book_bloc.dart';

@immutable
abstract class SuggestedBookEvent extends Equatable {}

final class SuggestedBookPicked extends SuggestedBookEvent {
  SuggestedBookPicked(this.pickedBook);

  @override
  List<Object?> get props => [pickedBook];

  final Book pickedBook;
}

final class NoBookPicked extends SuggestedBookEvent {
  @override
  List<Object?> get props => [];
}

final class BookPicked {}