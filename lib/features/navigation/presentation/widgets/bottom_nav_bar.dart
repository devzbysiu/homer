import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book.dart';
import '../../../find_new_book/presentation/bloc/search/book_search_bloc.dart';
import '../../../find_new_book/presentation/widgets/bottom_drawer_content.dart';
import '../../../manage_books/presentation/bloc/delete/delete_books_bloc.dart';
import '../../../manage_books/presentation/bloc/listing/books_bloc.dart';
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
    return MultiBlocListener(
      listeners: [
        _closeSheetWhenBooksLoaded(),
        _openSheetWhenBookShared(),
      ],
      child: BottomBarWithSheet(
        controller: _sheetController,
        duration: const Duration(milliseconds: 200),
        mainActionButtonBuilder: _mainActionButton,
        bottomBarTheme: _bottomBarTheme(context),
        onSelectItem: (idx) => _handleIndexChanged(idx, context),
        sheetChild: const BottomDrawerContent(),
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
        if (state is BooksLoaded) _sheetController.closeSheet();
      },
    );
  }

  BlocListener<BookSearchBloc, BookSearchState> _openSheetWhenBookShared() {
    return BlocListener<BookSearchBloc, BookSearchState>(
      listener: (context, state) {
        if (state is FetchingSharedBookDetails) _sheetController.openSheet();
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
    return BlocSelector<DeleteBooksBloc, DeleteBooksState, List<Book>>(
        selector: (state) => state.deletionList,
        builder: (context, booksToDelete) {
          return booksToDelete.isEmpty
              ? _AddButton(sheetController: _sheetController)
              : const _DeleteButton();
        });
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
        backgroundColor: Theme.of(context).primaryColor.msp(),
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
          backgroundColor: Theme.of(context).colorScheme.error.msp(),
          shape: const CircleBorder().msp(),
          padding: const EdgeInsets.all(10).msp(),
        ),
        child: Icon(
          Icons.delete_forever,
          color: Theme.of(context).colorScheme.background,
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
