import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/navigation/presentation/bloc/app_tab_bloc.dart';

extension AppTabContextExt on BuildContext {
  AppTab currentTab() {
    return select((AppTabBloc bloc) => bloc.state.currentTab);
  }

  void changeTab(AppTab newTab) {
    _emitAppTabEvt(TabChanged(newTab));
  }

  void _emitAppTabEvt(AppTabEvent event) {
    read<AppTabBloc>().add(event);
  }
}
