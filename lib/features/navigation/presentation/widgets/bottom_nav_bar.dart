import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../injection_container.dart';
import '../../../backup_and_restore/presentation/bloc/backup_and_restore_bloc.dart';
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
        BottomBarWithSheetItem(label: 'For Later', icon: Icons.bookmark),
        BottomBarWithSheetItem(label: 'Reading', icon: Icons.book),
        BottomBarWithSheetItem(label: 'Read', icon: Icons.done),
      ],
    );
  }

  BottomBarTheme _bottomBarTheme(BuildContext context) {
    return BottomBarTheme(
      heightOpened: 600,
      mainButtonPosition: MainButtonPosition.right,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(45)),
      ),
      itemIconColor: Colors.grey,
      itemTextStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 15.0,
      ),
      selectedItemTextStyle: TextStyle(
        color: context.figureOutColor(),
        fontSize: 15.0,
      ),
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
      onLongPress: () => _triggerBackupRestore(context), // TODO: remove this
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  void _toggleSheet() {
    sheetController.isOpened
        ? sheetController.closeSheet()
        : sheetController.openSheet();
  }

  // TODO: get rid of this
  Future<void> _triggerBackupRestore(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('books-restored') ?? false) {
      return Future.value();
    }
    final directory = await getApplicationDocumentsDirectory();
    final backupPath = '${directory.path}/backup.json';
    context.emitRestoreEvt(RestoreTriggered(backupPath));
    await Future.delayed(const Duration(seconds: 1));
    context.emitBooksEvt(BooksListDisplayed());
    prefs.setBool('books-restored', true);
    return Future.value();
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
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(15),
        ),
        child: const Icon(
          Icons.delete_forever,
          color: Colors.white,
        ),
      ),
    );
  }

  void _deleteBooks(BuildContext context, List<LocalBook> booksToDelete) async {
    context.emitBooksEvt(DeleteBooks(booksToDelete));
  }
}
