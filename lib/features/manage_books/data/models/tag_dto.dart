import 'package:equatable/equatable.dart';

class TagDTO extends Equatable {
  TagDTO({required this.name, required this.hexColor});

  late final String name;
  late final String hexColor;

  @override
  List<Object> get props => [name, hexColor];
}
