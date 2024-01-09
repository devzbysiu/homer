part of 'app_tab_bloc.dart';

@immutable
final class AppTabState extends Equatable {
  final AppTab currentTab;

  const AppTabState.readLater() : currentTab = AppTab.readLater;

  const AppTabState.reading() : currentTab = AppTab.reading;

  const AppTabState.read() : currentTab = AppTab.read;

  @override
  List<Object> get props => [currentTab];
}

enum AppTab {
  readLater,
  reading,
  read,
}
