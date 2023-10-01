part of 'suggested_book_bloc.dart';

@immutable
abstract class SuggestedBookEvent {}

final class SuggestedBookPicked extends SuggestedBookEvent {
  SuggestedBookPicked(this.pickedBook);

  final BookEntity pickedBook;
}

final class BookPicked {}