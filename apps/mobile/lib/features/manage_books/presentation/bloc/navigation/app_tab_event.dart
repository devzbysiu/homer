import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_tab_state.dart';

part 'app_tab_event.freezed.dart';

@freezed
sealed class AppTabEvent with _$AppTabEvent {
  const factory AppTabEvent.tabChanged({required AppTab selectedTab}) =
      TabChanged;
}
