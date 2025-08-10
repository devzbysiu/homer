import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/orchestrator/events.dart';

part 'share_book_event.freezed.dart';

@freezed
sealed class ShareBookEvent with _$ShareBookEvent implements BusEvent {
  const factory ShareBookEvent.bookSharedFromOutside(String url) =
      BookSharedFromOutside;
  const factory ShareBookEvent.clearSharedBook() = ClearSharedBook;
}
