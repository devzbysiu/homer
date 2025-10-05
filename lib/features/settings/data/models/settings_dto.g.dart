// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsDTO _$SettingsDTOFromJson(Map<String, dynamic> json) => SettingsDTO(
  isSystemThemeOn: json['isSystemThemeOn'] as bool,
  isDarkThemeOn: json['isDarkThemeOn'] as bool,
  backupsDirectory: _directoryFromJson(json['backupsDirectory'] as String),
  bookSizeLimits: _sizeLimitsFromJson(json['bookSizeLimits'] as List),
  readingGoal: _readingGoalFromJson((json['readingGoal'] as num).toInt()),
);

Map<String, dynamic> _$SettingsDTOToJson(SettingsDTO instance) =>
    <String, dynamic>{
      'isSystemThemeOn': instance.isSystemThemeOn,
      'isDarkThemeOn': instance.isDarkThemeOn,
      'bookSizeLimits': _sizeLimitsToJson(instance.bookSizeLimits),
      'backupsDirectory': _directoryToJson(instance.backupsDirectory),
      'readingGoal': _readingGoalToJson(instance.readingGoal),
    };
