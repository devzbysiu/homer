import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/orchestrator/events.dart';
import 'app_tab_state.dart';

part 'app_tab_event.freezed.dart';

@freezed
sealed class AppTabEvent with _$AppTabEvent implements BusEvent {
  const factory AppTabEvent.tabChanged(AppTab selectedTab) = TabChanged;
}
