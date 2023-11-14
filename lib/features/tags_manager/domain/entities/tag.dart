import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
@Embedded(inheritance: false)
final class Tag extends Equatable {
  Tag();

  late final String name;

  late final String hexColor;

  factory Tag.fromJson(Map<String, dynamic> json) {
    return _$TagFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TagToJson(this);

  @override
  @ignore
  List<Object> get props => [name, hexColor];
}
