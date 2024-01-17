import 'package:bloc_test/bloc_test.dart';
import 'package:homer/features/manage_books/presentation/bloc/navigation/app_tab_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('_onTabChanged', () {
    blocTest<AppTabBloc, AppTabState>(
      'should emit readLater when selected tab is readLater',
      build: () => AppTabBloc(),
      act: (bloc) => bloc.add(TabChanged(AppTab.readLater)),
      expect: () => [const AppTabState(currentTab: AppTab.readLater)],
    );

    blocTest<AppTabBloc, AppTabState>(
      'should emit reading when selected tab is reading',
      build: () => AppTabBloc(),
      act: (bloc) => bloc.add(TabChanged(AppTab.reading)),
      expect: () => [const AppTabState(currentTab: AppTab.reading)],
    );

    blocTest<AppTabBloc, AppTabState>(
      'should emit readLater when selected tab is read',
      build: () => AppTabBloc(),
      act: (bloc) => bloc.add(TabChanged(AppTab.read)),
      expect: () => [const AppTabState(currentTab: AppTab.read)],
    );
  });
}
