import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/menu_button.dart';

final class LogsButton extends StatelessWidget {
  const LogsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuButton(text: 'Logs', onPressed: () => context.go('/home/logs'));
  }
}
