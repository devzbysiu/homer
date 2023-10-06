part of 'app_tab_bloc.dart';

@immutable
abstract class AppTabEvent extends Equatable {}

final class TabChanged extends AppTabEvent {
  TabChanged(this.selectedTab);

  final AppTab selectedTab;

  @override
  List<Object?> get props => [selectedTab];
}
