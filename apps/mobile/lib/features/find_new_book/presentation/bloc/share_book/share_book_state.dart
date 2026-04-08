import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/book.dart';

part 'share_book_state.freezed.dart';

@freezed
sealed class ShareBookState with _$ShareBookState {
  const ShareBookState._();

  const factory ShareBookState.initial() = Initial;

  const factory ShareBookState.bookShared({required Book book}) = BookShared;

  const factory ShareBookState.bookNotShared() = BookNotShared;

  const factory ShareBookState.fetchingSharedBookDetails() =
      FetchingSharedBookDetails;

  const factory ShareBookState.fetchingDetailsFailed({required String cause}) =
      FetchingDetailsFailed;

  bool get isFetchingBookDetails =>
      maybeWhen(fetchingSharedBookDetails: () => true, orElse: () => false);

  bool get failedToLookUpSharedBook =>
      maybeWhen(fetchingDetailsFailed: (_) => true, orElse: () => false);

  String? get failureCause =>
      maybeWhen(fetchingDetailsFailed: (cause) => cause, orElse: () => null);

  Option<Book> get sharedBook =>
      maybeWhen(bookShared: (book) => Some(book), orElse: () => None());
}
