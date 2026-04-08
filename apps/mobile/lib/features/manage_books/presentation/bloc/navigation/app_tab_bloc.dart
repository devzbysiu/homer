import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_tab_event.dart';
import 'app_tab_state.dart';

final class AppTabBloc extends Bloc<AppTabEvent, AppTabState> {
  AppTabBloc() : super(const AppTabState.reading()) {
    on<TabChanged>(_onTabChanged);
  }

  Future<void> _onTabChanged(
    TabChanged event,
    Emitter<AppTabState> emit,
  ) async {
    switch (event.selectedTab) {
      case AppTab.readLater:
        emit(const AppTabState.readLater());
        break;
      case AppTab.reading:
        emit(const AppTabState.reading());
        break;
      case AppTab.read:
        emit(const AppTabState.read());
        break;
    }
  }
}

extension AppTabContextExt on BuildContext {
  AppTab currentTab() {
    return select((AppTabBloc bloc) => bloc.state.currentTab);
  }
}
