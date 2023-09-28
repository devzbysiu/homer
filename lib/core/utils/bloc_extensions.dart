import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/feature/navigation/bloc/app_tab_bloc.dart';

extension ContextColorExt on BuildContext {
  Color figureOutColor() {
    switch (currentTab()) {
      case AppTab.readLater:
        return Colors.green;
      case AppTab.reading:
        return Colors.blue;
      case AppTab.read:
        return Colors.amber;
    }
  }

  AppTab currentTab() {
    return select((AppTabBloc bloc) => bloc.state.currentTab);
  }
}

