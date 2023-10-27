// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalSettingsDTO _$LocalSettingsDTOFromJson(Map<String, dynamic> json) =>
    LocalSettingsDTO(
      isSystemTheme: json['isSystemTheme'] as bool,
      isDarkTheme: json['isDarkTheme'] as bool,
    );

Map<String, dynamic> _$LocalSettingsDTOToJson(LocalSettingsDTO instance) =>
    <String, dynamic>{
      'isSystemTheme': instance.isSystemTheme,
      'isDarkTheme': instance.isDarkTheme,
    };
