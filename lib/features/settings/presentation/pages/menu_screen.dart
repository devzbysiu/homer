import 'package:flutter/material.dart';

import '../widgets/menu_items.dart';
import '../widgets/theme_switcher.dart';

final class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5),
          child: MenuItems(),
        ),
        Positioned(
          bottom: 80,
          left: 5,
          child: ThemeSwitcher(),
        )
      ],
    );
  }
}
