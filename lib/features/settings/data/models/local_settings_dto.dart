import 'package:json_annotation/json_annotation.dart';

part 'local_settings_dto.g.dart';

@JsonSerializable()
final class LocalSettingsDTO {
  const LocalSettingsDTO({
    required this.isSystemTheme,
    required this.isDarkTheme,
  });

  final bool isSystemTheme;

  final bool isDarkTheme;

  Map<String, dynamic> toJson() => _$LocalSettingsDTOToJson(this);

  factory LocalSettingsDTO.fromJson(Map<String, dynamic> json) {
    return _$LocalSettingsDTOFromJson(json);
  }
}
