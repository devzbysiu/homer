import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/book_size_limits.dart';

part 'local_settings_dto.g.dart';

@JsonSerializable()
final class LocalSettingsDTO {
  const LocalSettingsDTO({
    required this.isSystemThemeOn,
    required this.isDarkThemeOn,
    required this.backupsDirectory,
    required this.bookSizeLimits,
  });

  final bool isSystemThemeOn;

  final bool isDarkThemeOn;

  @JsonKey(fromJson: _sizeLimitsFromJson, toJson: _sizeLimitsToJson)
  final BookSizeLimits bookSizeLimits;

  @JsonKey(fromJson: _directoryFromJson, toJson: _directoryToJson)
  final Directory backupsDirectory;

  Map<String, dynamic> toJson() => _$LocalSettingsDTOToJson(this);

  factory LocalSettingsDTO.fromJson(Map<String, dynamic> json) {
    return _$LocalSettingsDTOFromJson(json);
  }
}

Directory _directoryFromJson(String backupDirPath) => Directory(backupDirPath);

String _directoryToJson(Directory directory) => directory.path;

BookSizeLimits _sizeLimitsFromJson(List<dynamic> sizeLimits) {
  return BookSizeLimits(shortMax: sizeLimits[0], mediumMax: sizeLimits[1]);
}

List<int> _sizeLimitsToJson(BookSizeLimits limits) => limits.asIntList();
