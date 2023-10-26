import 'package:flutter/material.dart';

import '../../../../core/widgets/menu_button.dart';
import '../../../backup_and_restore/presentation/widgets/backup_button.dart';
import '../../../backup_and_restore/presentation/widgets/restore_button.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const BackupButton(),
        spaceBetween(),
        const RestoreButton(),
        spaceBetween(),
        MenuButton(
          text: 'Stats',
          onPressed: () {},
        ),
        spaceBetween(),
        MenuButton(
          text: 'Settings',
          onPressed: () {},
        ),
        spaceBetween(),
      ],
    );
  }

  SizedBox spaceBetween() => const SizedBox(height: 20);
}
