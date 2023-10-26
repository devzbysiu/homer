import 'package:flutter/material.dart';

final class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primaryContainer,
      onTap: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
