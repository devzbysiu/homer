import 'dart:convert';

import 'package:multiple_result/multiple_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/local_settings_dto.dart';

abstract class LocalSettingsDataSource {
  Future<Unit> save(LocalSettingsDTO settingsDTO);

  Future<LocalSettingsDTO> load();
}

final class SharedPreferencesSettingsDataSource
    implements LocalSettingsDataSource {
  const SharedPreferencesSettingsDataSource({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<Unit> save(LocalSettingsDTO settingsDTO) async {
    final jsonSettings = jsonEncode(settingsDTO.toJson());
    sharedPreferences.setString('settings', jsonSettings);
    return Future.value(unit);
  }

  @override
  Future<LocalSettingsDTO> load() {
    final settingsJson = sharedPreferences.getString('settings');
    if (settingsJson == null) throw NoSettingsException();
    final settingsDTO = LocalSettingsDTO.fromJson(jsonDecode(settingsJson!));
    return Future.value(settingsDTO);
  }
}
