part of 'app_tab_bloc.dart';

@immutable
final class AppTabState extends Equatable {
  const AppTabState._({
    this.currentTab = AppTab.readLater,
  });

  final AppTab currentTab;

  const AppTabState.readLater() : this._(currentTab: AppTab.readLater);

  const AppTabState.reading() : this._(currentTab: AppTab.reading);

  const AppTabState.read() : this._(currentTab: AppTab.read);

  @override
  List<Object> get props => [currentTab];
}

enum AppTab {
  readLater,
  reading,
  read,
}
