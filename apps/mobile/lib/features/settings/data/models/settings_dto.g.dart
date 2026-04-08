// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsDTO _$SettingsDTOFromJson(Map<String, dynamic> json) => SettingsDTO(
  isSystemThemeOn: json['isSystemThemeOn'] as bool,
  isDarkThemeOn: json['isDarkThemeOn'] as bool,
  bookSizeLimits: _sizeLimitsFromJson(json['bookSizeLimits'] as List),
  readingGoal: _readingGoalFromJson((json['readingGoal'] as num).toInt()),
);

Map<String, dynamic> _$SettingsDTOToJson(SettingsDTO instance) =>
    <String, dynamic>{
      'isSystemThemeOn': instance.isSystemThemeOn,
      'isDarkThemeOn': instance.isDarkThemeOn,
      'bookSizeLimits': _sizeLimitsToJson(instance.bookSizeLimits),
      'readingGoal': _readingGoalToJson(instance.readingGoal),
    };
