// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalSettingsDTO _$LocalSettingsDTOFromJson(Map<String, dynamic> json) =>
    LocalSettingsDTO(
      isSystemThemeOn: json['isSystemThemeOn'] as bool,
      isDarkThemeOn: json['isDarkThemeOn'] as bool,
      backupsDirectory: _directoryFromJson(json['backupsDirectory'] as String),
      bookSizeLimits: _sizeLimitsFromJson(json['bookSizeLimits'] as List),
    );

Map<String, dynamic> _$LocalSettingsDTOToJson(LocalSettingsDTO instance) =>
    <String, dynamic>{
      'isSystemThemeOn': instance.isSystemThemeOn,
      'isDarkThemeOn': instance.isDarkThemeOn,
      'bookSizeLimits': _sizeLimitsToJson(instance.bookSizeLimits),
      'backupsDirectory': _directoryToJson(instance.backupsDirectory),
    };
