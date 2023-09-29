part of 'app_tab_bloc.dart';

@immutable
class AppTabState {
  const AppTabState._({
    this.currentTab = AppTab.readLater,
  });

  const AppTabState.readLater() : this._(currentTab: AppTab.readLater);

  const AppTabState.reading() : this._(currentTab: AppTab.reading);

  const AppTabState.read() : this._(currentTab: AppTab.read);

  final AppTab currentTab;
}

enum AppTab {
  readLater,
  reading,
  read,
}


