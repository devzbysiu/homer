part of 'share_book_bloc.dart';

@immutable
abstract class ShareBookEvent extends Equatable {}

final class BookSharedFromOutside extends ShareBookEvent {
  BookSharedFromOutside(this.url);

  final String url;

  @override
  List<Object?> get props => [url];
}

final class ClearSharedBook extends ShareBookEvent {
  @override
  List<Object?> get props => [];
}
