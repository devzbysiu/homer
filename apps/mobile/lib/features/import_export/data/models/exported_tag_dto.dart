import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exported_tag_dto.g.dart';

@JsonSerializable()
final class ExportedTagDTO extends Equatable {
  const ExportedTagDTO({required this.name, required this.hexColor});

  final String name;

  final String hexColor;

  factory ExportedTagDTO.fromJson(Map<String, dynamic> json) {
    return _$ExportedTagDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExportedTagDTOToJson(this);

  @override
  List<Object> get props => [name, hexColor];
}
