part of 'app_tab_bloc.dart';

@immutable
abstract class AppTabEvent {}

final class TabChanged extends AppTabEvent {
  TabChanged(this.selectedTab);

  final AppTab selectedTab;
}
