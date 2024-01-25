part of 'settings_bloc.dart';

final class SettingsState extends Equatable {
  const SettingsState({required this.settings});

  SettingsState.initial() : settings = Settings.makeDefault();

  const SettingsState.from(this.settings);

  SettingsState.failedToLoad() : settings = Settings.makeDefault();

  SettingsState.failedToSave() : settings = Settings.makeDefault();

  final Settings settings;

  SettingsState toggleDarkTheme() {
    return SettingsState.from(settings.toggleDarkTheme());
  }

  SettingsState toggleSystemTheme() {
    return SettingsState.from(settings.toggleSystemTheme());
  }

  SettingsState changeBackupDir(Directory newDir) {
    return SettingsState.from(settings.changeBackupDir(newDir));
  }

  SettingsState changeSizeLimits(BookSizeLimits limits) {
    return SettingsState.from(settings.changeSizeLimits(limits));
  }

  SettingsState changeReadingGoal(ReadingGoal goal) {
    return SettingsState.from(settings.changeReadingGoal(goal));
  }

  bool get useDarkTheme => settings.useDarkTheme;

  bool get useSystemTheme => settings.useSystemTheme;

  Directory get backupsDir => settings.backupsDir;

  BookSizeLimits get bookSizeLimits => settings.bookSizeLimits;

  @override
  List<Object> get props => [settings];
}
