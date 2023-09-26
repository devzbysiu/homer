import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.label});

  final BookLabel label;

  @override
  Widget build(BuildContext context) {
      return InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.green,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          child: Text(
            label.name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
  }
}
