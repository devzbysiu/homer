import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_tab_event.dart';

part 'app_tab_state.dart';

class AppTabBloc extends Bloc<AppTabEvent, AppTabState> {
  AppTabBloc() : super(const AppTabState.readLater()) {
    on<TabChanged>(_onTabChanged);
  }

  FutureOr<void> _onTabChanged(
    TabChanged event,
    Emitter<AppTabState> emit,
  ) async {
    switch (event.selectedTab) {
      case AppTab.readLater:
        return emit(const AppTabState.readLater());
      case AppTab.reading:
        return emit(const AppTabState.reading());
      case AppTab.read:
        return emit(const AppTabState.read());
    }
  }
}
