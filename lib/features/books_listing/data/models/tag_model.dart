final class TagModel {
  TagModel({required this.name, required this.color});

  final String name;

  final TagModelColor color;
}

enum TagModelColor { red, green, blue, black, brown, orange }
