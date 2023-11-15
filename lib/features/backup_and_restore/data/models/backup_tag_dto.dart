import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'backup_tag_dto.g.dart';

@JsonSerializable()
final class BackupTagDTO extends Equatable {
  const BackupTagDTO({required this.name, required this.hexColor});

  final String name;

  final String hexColor;

  factory BackupTagDTO.fromJson(Map<String, dynamic> json) {
    return _$BackupTagDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BackupTagDTOToJson(this);

  @override
  List<Object> get props => [name, hexColor];
}
