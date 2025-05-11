import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/menu_button.dart';

final class LogsButton extends StatelessWidget {
  const LogsButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Why the Row is here?
    return Row(
      children: [
        MenuButton(text: 'Logs', onPressed: () => context.go('/home/logs')),
      ],
    );
  }
}
