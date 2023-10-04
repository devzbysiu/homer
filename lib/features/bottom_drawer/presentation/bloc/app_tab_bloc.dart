import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'app_tab_event.dart';

part 'app_tab_state.dart';

final class AppTabBloc extends Bloc<AppTabEvent, AppTabState> {
  AppTabBloc() : super(const AppTabState.readLater()) {
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
