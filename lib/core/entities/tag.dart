import 'package:equatable/equatable.dart';

final class Tag extends Equatable {
  const Tag({required this.name, required this.hexColor});

  final String name;

  final String hexColor;

  @override
  List<Object> get props => [name, hexColor];
}
