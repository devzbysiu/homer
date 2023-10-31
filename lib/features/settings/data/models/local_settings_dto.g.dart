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
      bookSizeLimits: (json['bookSizeLimits'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$LocalSettingsDTOToJson(LocalSettingsDTO instance) =>
    <String, dynamic>{
      'isSystemThemeOn': instance.isSystemThemeOn,
      'isDarkThemeOn': instance.isDarkThemeOn,
      'bookSizeLimits': instance.bookSizeLimits,
      'backupsDirectory': _directoryToJson(instance.backupsDirectory),
    };
