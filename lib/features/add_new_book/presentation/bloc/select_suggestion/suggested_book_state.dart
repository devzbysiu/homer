part of 'suggested_book_bloc.dart';

@immutable
abstract class SuggestedBookState extends Equatable {
  const SuggestedBookState({this.pickedBook});

  final Book? pickedBook;
}

final class BookPickedState extends SuggestedBookState {
  const BookPickedState({super.pickedBook});

  @override
  List<Object?> get props => [pickedBook];
}

final class NoPickedBook extends SuggestedBookState {
  @override
  List<Object?> get props => [];
}
