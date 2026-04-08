import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@freezed
abstract class TagDTO with _$TagDTO {
  const factory TagDTO({required String name, required String hexColor}) =
      _TagDTO;

  factory TagDTO.fromJson(Map<String, dynamic> json) => _$TagDTOFromJson(json);
}
