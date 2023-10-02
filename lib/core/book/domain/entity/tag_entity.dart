final class TagEntity {
  const TagEntity({required this.name, required this.color});

  final String name;

  final TagColor color;

}

enum TagColor {
  red,
  green,
  blue,
  black,
  brown,
  orange
}