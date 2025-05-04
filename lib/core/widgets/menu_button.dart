import 'package:flutter/material.dart';

import '../utils/theme.dart';

final class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.text, required this.onPressed});

  final String text;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: context.primaryContainer,
      onTap: onPressed,
      child: Text(text, style: context.headlineMedium),
    );
  }
}
