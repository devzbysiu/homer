import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
final class Tag extends Equatable {
  const Tag({required this.name, required this.hexColor});

  final String name;

  final String hexColor;

  factory Tag.fromJson(Map<String, dynamic> json) {
    return _$TagFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TagToJson(this);

  @override
  @ignore
  List<Object> get props => [name, hexColor];
}
