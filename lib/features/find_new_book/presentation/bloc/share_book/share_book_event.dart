import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_book_event.freezed.dart';

@freezed
sealed class ShareBookEvent with _$ShareBookEvent {
  const factory ShareBookEvent.bookSharedFromOutside({required String url}) =
      BookSharedFromOutside;
  const factory ShareBookEvent.clearSharedBook() = ClearSharedBook;
}
