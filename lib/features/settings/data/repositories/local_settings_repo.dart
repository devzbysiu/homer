import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/mappers/local_settings_mapper.dart';
import '../../domain/entities/local_settings.dart';
import '../../domain/repositories/local_settings_repository.dart';
import '../datasources/local_settings_data_source.dart';

final class LocalSettingsRepo implements LocalSettingsRepository {
  const LocalSettingsRepo({required this.settingsDataSource});

  final LocalSettingsDataSource settingsDataSource;

  @override
  Future<Result<Unit, Failure>> save(LocalSettings settings) async {
    final settingsDTO = toSettingsDTO(settings);
    await settingsDataSource.save(settingsDTO);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<LocalSettings, Failure>> load() async {
    try {
      final settingsDTO = await settingsDataSource.load();
      final settings = toLocalSettings(
        settingsDTO.isSystemThemeOn,
        settingsDTO.isDarkThemeOn,
        settingsDTO.backupsDirectory,
        settingsDTO.bookSizeLimits,
      );
      return Future.value(Success(settings));
    } on NoSettingsException {
      return Future.value(Success(LocalSettings.makeDefault()));
    }
  }
}
