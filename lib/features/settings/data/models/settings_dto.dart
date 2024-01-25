import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/book_size_limits.dart';
import '../../domain/entities/reading_goal.dart';

part 'settings_dto.g.dart';

@JsonSerializable()
final class SettingsDTO extends Equatable {
  const SettingsDTO({
    required this.isSystemThemeOn,
    required this.isDarkThemeOn,
    required this.backupsDirectory,
    required this.bookSizeLimits,
    required this.readingGoal,
  });

  final bool isSystemThemeOn;

  final bool isDarkThemeOn;

  @JsonKey(fromJson: _sizeLimitsFromJson, toJson: _sizeLimitsToJson)
  final BookSizeLimits bookSizeLimits;

  @JsonKey(fromJson: _directoryFromJson, toJson: _directoryToJson)
  final Directory backupsDirectory;

  @JsonKey(fromJson: _readingGoalFromJson, toJson: _readingGoalToJson)
  final ReadingGoal readingGoal;

  Map<String, dynamic> toJson() => _$SettingsDTOToJson(this);

  factory SettingsDTO.fromJson(Map<String, dynamic> json) {
    return _$SettingsDTOFromJson(json);
  }

  @override
  List<Object> get props => [
        isSystemThemeOn,
        isDarkThemeOn,
        bookSizeLimits,
        backupsDirectory.path,
        readingGoal,
      ];
}

Directory _directoryFromJson(String backupDirPath) => Directory(backupDirPath);

String _directoryToJson(Directory directory) => directory.path;

BookSizeLimits _sizeLimitsFromJson(List<dynamic> sizeLimits) {
  return BookSizeLimits(shortMax: sizeLimits[0], mediumMax: sizeLimits[1]);
}

List<int> _sizeLimitsToJson(BookSizeLimits limits) => limits.asIntList();

ReadingGoal _readingGoalFromJson(int goal) => ReadingGoal(books: goal);

int _readingGoalToJson(ReadingGoal goal) => goal.books;
