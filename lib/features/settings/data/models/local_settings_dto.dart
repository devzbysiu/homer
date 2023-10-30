import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'local_settings_dto.g.dart';

@JsonSerializable()
final class LocalSettingsDTO {
  const LocalSettingsDTO({
    required this.isSystemTheme,
    required this.isDarkTheme,
    required this.backupsDirectory,
  });

  final bool isSystemTheme;

  final bool isDarkTheme;

  @JsonKey(fromJson: _directoryFromJson, toJson: _directoryToJson)
  final Directory backupsDirectory;

  Map<String, dynamic> toJson() => _$LocalSettingsDTOToJson(this);

  factory LocalSettingsDTO.fromJson(Map<String, dynamic> json) {
    return _$LocalSettingsDTOFromJson(json);
  }
}

Directory _directoryFromJson(String backupDirPath) => Directory(backupDirPath);

String _directoryToJson(Directory directory) => directory.path;
