import 'package:isar/isar.dart';

part 'tag_dto.g.dart';

@embedded
final class TagDTO {
  late final String name;

  @enumerated
  late final TagColorDTO color;
}

enum TagColorDTO { red, green, blue, black, brown, orange }
