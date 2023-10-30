// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalSettingsDTO _$LocalSettingsDTOFromJson(Map<String, dynamic> json) =>
    LocalSettingsDTO(
      isSystemThemeOn: json['isSystemTheme'] as bool,
      isDarkThemeOn: json['isDarkTheme'] as bool,
      backupsDirectory: _directoryFromJson(json['backupsDirectory'] as String),
    );

Map<String, dynamic> _$LocalSettingsDTOToJson(LocalSettingsDTO instance) =>
    <String, dynamic>{
      'isSystemTheme': instance.isSystemThemeOn,
      'isDarkTheme': instance.isDarkThemeOn,
      'backupsDirectory': _directoryToJson(instance.backupsDirectory),
    };
