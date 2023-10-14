import 'package:flutter/material.dart';

MaterialStateProperty<T> msp<T>(T property) {
  return MaterialStateProperty.all(property);
}
