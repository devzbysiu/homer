import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/backup_and_restore/presentation/bloc/backup_bloc.dart';

extension BackupContextExt on BuildContext {
  void restoreBackup(String backupPath) {
    _emitRestoreEvt(RestoreTriggered(backupPath));
  }

  void createBackup(String backupPath) {
    _emitRestoreEvt(BackupTriggered(backupPath));
  }

  bool isRestoreInProgress() {
    return select((BackupBloc bloc) => bloc.state.isRestoreInProgress);
  }

  bool isBackupInProgress() {
    return select((BackupBloc bloc) => bloc.state.isBackupInProgress);
  }

  void _emitRestoreEvt(BackupEvent event) {
    read<BackupBloc>().add(event);
  }
}
