import 'package:flutter/material.dart';

import '../../features/tags_manager/domain/entities/tag.dart';

Color toFlutterColor(TagColor color) {
  switch (color) {
    case TagColor.brown:
      return Colors.brown;
    case TagColor.black:
      return Colors.black;
    case TagColor.green:
      return Colors.green;
    case TagColor.blue:
      return Colors.blue;
    case TagColor.orange:
      return Colors.orange;
    case TagColor.red:
      return Colors.red;
  }
}