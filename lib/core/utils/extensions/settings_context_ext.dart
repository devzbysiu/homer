import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/settings/presentation/bloc/settings_bloc.dart';

extension SettingsContextExt on BuildContext {
  bool isThemeDark() {
    return select((SettingsBloc bloc) => bloc.state.isThemeDark);
  }

  void toggleTheme() {
    _emitSettingsEvt(ThemeToggled());
  }

  void _emitSettingsEvt(SettingsEvent event) {
    read<SettingsBloc>().add(event);
  }
}
