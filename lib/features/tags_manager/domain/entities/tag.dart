final class Tag {
  const Tag({required this.name, required this.color});

  final String name;

  final TagColor color;
}

enum TagColor { red, green, blue, black, brown, orange }
