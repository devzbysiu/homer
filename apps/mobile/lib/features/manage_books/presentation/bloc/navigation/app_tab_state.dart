import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_tab_state.freezed.dart';

enum AppTab { readLater, reading, read }

@freezed
sealed class AppTabState with _$AppTabState {
  const AppTabState._(); // enables the getter below

  const factory AppTabState.readLater() = ReadLater;
  const factory AppTabState.reading() = Reading;
  const factory AppTabState.read() = Read;

  AppTab get currentTab => when(
    readLater: () => AppTab.readLater,
    reading: () => AppTab.reading,
    read: () => AppTab.read,
  );
}
