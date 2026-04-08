import 'dart:convert';

import 'package:multiple_result/multiple_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/settings_dto.dart';

abstract class SettingsDataSource {
  Future<Unit> save(SettingsDTO settingsDTO);

  Future<SettingsDTO> load();
}

// TODO: This should catch library exception and rethrow application exception
final class SharedPrefsSettingsDataSource implements SettingsDataSource {
  const SharedPrefsSettingsDataSource({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<Unit> save(SettingsDTO settingsDTO) async {
    final jsonSettings = jsonEncode(settingsDTO.toJson());
    sharedPreferences.setString('settings', jsonSettings);
    return unit;
  }

  @override
  Future<SettingsDTO> load() async {
    final settingsJson = sharedPreferences.getString('settings');
    if (settingsJson == null) throw NoSettingsException();
    return SettingsDTO.fromJson(jsonDecode(settingsJson));
  }
}
