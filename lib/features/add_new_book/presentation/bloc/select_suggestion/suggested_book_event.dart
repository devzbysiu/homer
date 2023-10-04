part of 'suggested_book_bloc.dart';

@immutable
abstract class SuggestedBookEvent {}

final class SuggestedBookPicked extends SuggestedBookEvent {
  SuggestedBookPicked(this.pickedBook);

  final Book pickedBook;
}

final class ClearPickedBook extends SuggestedBookEvent {}

final class BookPicked {}