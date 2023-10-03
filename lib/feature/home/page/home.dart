import 'package:flutter/material.dart';

import '../../../core/utils/extensions.dart';
import '../../book/widget/books_list.dart';
import '../../bottom_drawer/widget/bottom_nav_bar.dart';

final class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        color: context.figureOutColor(),
        child: const BooksList(),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
