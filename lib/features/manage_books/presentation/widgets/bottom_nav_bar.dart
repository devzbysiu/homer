import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/orchestrator/bus.dart';
import '../../../../core/orchestrator/events.dart';
import '../../../../core/utils/theme.dart';
import '../../../../injection_container.dart';
import '../../../find_new_book/presentation/bloc/share_book/share_book_bloc.dart';
import '../../../find_new_book/presentation/widgets/bottom_drawer_content.dart';
import '../../../manage_books/presentation/bloc/delete/delete_books_bloc.dart';
import '../../../manage_books/presentation/bloc/listing/books_bloc.dart';
import '../bloc/navigation/app_tab_bloc.dart';

final class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key, Bus? eventBus}) : _eventBus = eventBus ?? sl<Bus>();

  final Bus _eventBus;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

final class _BottomNavBarState extends State<BottomNavBar> {
  final _sheetCtl = BottomBarWithSheetController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        _closeSheetWhenBooksLoaded(),
        _openSheetWhenBookShared(),
      ],
      child: BottomBarWithSheet(
        controller: _sheetCtl,
        duration: const Duration(milliseconds: 200),
        mainActionButtonBuilder: _mainActionButton,
        bottomBarTheme: _bottomBarTheme(context),
        onSelectItem: (idx) => _changeTab(idx),
        sheetChild: BottomDrawerContent(),
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

  BlocListener<BooksBloc, BooksState> _closeSheetWhenBooksLoaded() {
    return BlocListener<BooksBloc, BooksState>(
      listener: (context, state) {
        if (state.value == StateValue.booksLoaded) _sheetCtl.closeSheet();
      },
    );
  }

  BlocListener<ShareBookBloc, ShareBookState> _openSheetWhenBookShared() {
    return BlocListener<ShareBookBloc, ShareBookState>(
      listener: (context, state) {
        if (state.isFetchingBookDetails) _sheetCtl.openSheet();
      },
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
            color: context.shadow,
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        color: context.background,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(45)),
      ),
      itemIconColor: context.unselected,
      itemTextStyle: context.bodyMedium,
      selectedItemTextStyle: context.bodyMedium,
    );
  }

  void _changeTab(int i) => widget._eventBus.fire(TabTapped(AppTab.values[i]));

  Widget _mainActionButton(BuildContext context) {
    return BlocSelector<DeleteBooksBloc, DeleteBooksState, List<Book>>(
      selector: (state) => state.deletionList,
      builder: (context, booksToDelete) {
        return booksToDelete.isEmpty
            ? _AddButton(sheetController: _sheetCtl)
            : _DeleteButton();
      },
    );
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
        shape: const CircleBorder().msp(),
        padding: const EdgeInsets.all(10).msp(),
        backgroundColor: context.primary.msp(),
      ),
      child: Icon(
        Icons.add,
        color: context.background,
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
  _DeleteButton({Bus? eventBus}) : _eventBus = eventBus ?? sl<Bus>();

  final Bus _eventBus;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: const [ShakeEffect(hz: 2.5)],
      child: ElevatedButton(
        onPressed: () => _eventBus.fire(DeleteBooksStarted()),
        style: ButtonStyle(
          backgroundColor: context.error.msp(),
          shape: const CircleBorder().msp(),
          padding: const EdgeInsets.all(10).msp(),
        ),
        child: Icon(
          Icons.delete_forever,
          color: context.background,
        ),
      ),
    );
  }
}

extension _MspExt<T> on T {
  MaterialStateProperty<T> msp() {
    return MaterialStateProperty.all(this);
  }
}
