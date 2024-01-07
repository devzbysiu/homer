import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_data_source.dart';
import '../mappers/to_settings.dart';
import '../mappers/to_settings_dto.dart';

final class SettingsRepo implements SettingsRepository {
  const SettingsRepo({required this.settingsDataSource});

  final SettingsDataSource settingsDataSource;

  @override
  Future<Result<Unit, Failure>> save(Settings settings) async {
    final settingsDTO = toSettingsDTO(settings);
    await settingsDataSource.save(settingsDTO);
    return const Success(unit);
  }

  @override
  Future<Result<Settings, Failure>> load() async {
    try {
      final settingsDTO = await settingsDataSource.load();
      final settings = toSettings(
        isSystemThemeOn: settingsDTO.isSystemThemeOn,
        isDarkThemeOn: settingsDTO.isDarkThemeOn,
        backupsDirectory: settingsDTO.backupsDirectory,
        bookSizeLimits: settingsDTO.bookSizeLimits,
      );
      return Success(settings);
    } on NoSettingsException {
      return Success(Settings.makeDefault());
    }
  }
}
