import 'package:isar/isar.dart';

part 'local_tag_dto.g.dart';

@embedded
final class LocalTagDTO {
  late final String name;

  @enumerated
  late final LocalTagColorDTO color;
}

enum LocalTagColorDTO {
  red,
  green,
  blue,
  black,
  brown,
  orange,
  yellow,
  grey,
  purple,
}
