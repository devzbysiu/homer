import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/common.dart';
import '../../../../core/utils/extensions/app_tab_context_ext.dart';
import '../../../../core/utils/extensions/delete_books_context_ext.dart';
import '../../../books_listing/presentation/bloc/books_bloc.dart';
import '../../../search/presentation/widgets/books_search_area.dart';
import '../../presentation/bloc/app_tab_bloc.dart';

final class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

final class _BottomNavBarState extends State<BottomNavBar> {
  final _sheetController = BottomBarWithSheetController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BooksBloc, BooksState>(
      listener: (context, state) {
        if (state is BooksLoaded) _sheetController.closeSheet();
      },
      child: BottomBarWithSheet(
        controller: _sheetController,
        duration: const Duration(milliseconds: 200),
        mainActionButtonBuilder: _mainActionButton,
        bottomBarTheme: _bottomBarTheme(context),
        onSelectItem: (idx) => _handleIndexChanged(idx, context),
        sheetChild: const BookSearchArea(),
        items: const [
          BottomBarWithSheetItem(
            label: 'For Later',
            icon: Icons.bookmark_outline,
          ),
          BottomBarWithSheetItem(
            label: 'Reading',
            icon: Icons.book_outlined,
          ),
          BottomBarWithSheetItem(
            label: 'Read',
            icon: Icons.done_outline,
          ),
        ],
      ),
    );
  }

  BottomBarTheme _bottomBarTheme(BuildContext context) {
    return BottomBarTheme(
      heightOpened: 600,
      heightClosed: 60,
      mainButtonPosition: MainButtonPosition.right,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(45)),
      ),
      itemIconColor: Theme.of(context).unselectedWidgetColor,
      itemTextStyle: Theme.of(context).textTheme.bodyMedium,
      selectedItemTextStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }

  void _handleIndexChanged(int i, BuildContext context) {
    context.changeTab(AppTab.values[i]);
  }

  Widget _mainActionButton(BuildContext context) {
    final booksToDelete = context.booksToDelete();
    return booksToDelete.isEmpty
        ? _AddButton(sheetController: _sheetController)
        : const _DeleteButton();
  }
}

final class _AddButton extends StatelessWidget {
  const _AddButton({required this.sheetController});

  final BottomBarWithSheetController sheetController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _toggleSheet,
      style: ButtonStyle(
        shape: msp(const CircleBorder()),
        padding: msp(const EdgeInsets.all(10)),
      ),
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }

  void _toggleSheet() {
    sheetController.isOpened
        ? sheetController.closeSheet()
        : sheetController.openSheet();
  }
}

final class _DeleteButton extends StatelessWidget {
  const _DeleteButton();

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: const [ShakeEffect(hz: 2.5)],
      child: ElevatedButton(
        onPressed: () => context.deletePickedBooks(),
        style: ButtonStyle(
          backgroundColor: msp(Theme.of(context).colorScheme.error),
          shape: msp(const CircleBorder()),
          padding: msp(const EdgeInsets.all(10)),
        ),
        child: Icon(
          Icons.delete_forever,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
