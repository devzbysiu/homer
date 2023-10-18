import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/utils/common.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../injection_container.dart';
import '../../../books_listing/domain/entities/local_book.dart';
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

  bool listenerHooked = false;

  @override
  Widget build(BuildContext context) {
    _closeSheetWhenBookSaved();
    return BottomBarWithSheet(
      controller: _sheetController,
      mainActionButtonBuilder: _mainActionButton,
      bottomBarTheme: _bottomBarTheme(context),
      onSelectItem: (idx) => _handleIndexChanged(idx, context),
      sheetChild: BookSearchArea(),
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
    );
  }

  BottomBarTheme _bottomBarTheme(BuildContext context) {
    return BottomBarTheme(
      heightOpened: 600,
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
    context.emitAppTabEvt(TabChanged(AppTab.values[i]));
  }

  void _closeSheetWhenBookSaved() {
    if (!listenerHooked) {
      sl<EventBus>().on<BookSaved>().listen((_) {
        _sheetController.closeSheet();
      });
      listenerHooked = true;
    }
  }

  Widget _mainActionButton(BuildContext context) {
    final booksToDelete = context.booksToDelete();
    return booksToDelete.isEmpty
        ? _AddButton(sheetController: _sheetController)
        : _DeleteButton(booksToDelete: booksToDelete);
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
  const _DeleteButton({required this.booksToDelete});

  final List<LocalBook> booksToDelete;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: const [ShakeEffect(hz: 2.5)],
      child: ElevatedButton(
        onPressed: () => _deleteBooks(context, booksToDelete),
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

  void _deleteBooks(BuildContext context, List<LocalBook> booksToDelete) async {
    context.emitBooksEvt(DeleteBooks(booksToDelete));
  }
}
