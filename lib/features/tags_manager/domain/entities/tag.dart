import 'package:equatable/equatable.dart';

final class Tag extends Equatable {
  const Tag({required this.name, required this.color});

  final String name;

  final TagColor color;

  @override
  List<Object> get props => [name, color];
}

enum TagColor {
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
