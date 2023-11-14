import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'local_tag_dto.g.dart';

@Embedded(inheritance: false)
final class LocalTagDTO extends Equatable {
  late final String name;

  late final String hexColor;

  @ignore
  @override
  List<Object> get props => [name, hexColor];
}
