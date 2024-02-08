import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/menu_button.dart';

final class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuButton(
          text: 'Settings',
          onPressed: () => context.go('/home/settings'),
        )
      ],
    );
  }
}
