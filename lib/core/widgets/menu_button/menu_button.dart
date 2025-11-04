import 'package:flutter/material.dart';

import 'menu_button_theme.dart';

final class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.text, required this.onPressed});

  final String text;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.menuButtonTheme;
    return InkWell(
      splashColor: theme.splashColor,
      onTap: onPressed,
      child: Text(text, style: theme.textStyle),
    );
  }
}
