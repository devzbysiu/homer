import 'package:flutter/material.dart';

final class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SettingButton(
          text: 'Make backup',
          onPressed: () {},
        ),
        const SizedBox(height: 20),
        _SettingButton(
          text: 'Stats',
          onPressed: () {},
        ),
        const SizedBox(height: 20),
        _SettingButton(
          text: 'Settings',
          onPressed: () {},
        ),
      ],
    );
  }
}

final class _SettingButton extends StatelessWidget {
  const _SettingButton({required this.text, required this.onPressed});

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
