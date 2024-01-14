import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/menu_button.dart';

final class StatsButton extends StatelessWidget {
  const StatsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuButton(
          text: 'Stats',
          onPressed: () => context.go('/stats'),
        )
      ],
    );
  }
}
