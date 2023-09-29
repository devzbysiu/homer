import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/use_case/books/books_bloc.dart';
import 'package:homer/core/utils/extensions.dart';
import 'package:homer/core/book/domain/use_case/app_tab/app_tab_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return BottomBarWithSheet(
      controller: _bottomBarController,
      bottomBarTheme: BottomBarTheme(
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
      ),
      onSelectItem: (idx) => _handleIndexChanged(idx, context),
      sheetChild: Center(
        child: ElevatedButton(onPressed: () {
          context.emitBooksEvt(BookAdded(BookEntity.fake()));
        }, child: const Text('Ok'),
        ),
      ),
      items: const [
        BottomBarWithSheetItem(label: 'For Later', icon: Icons.bookmark),
        BottomBarWithSheetItem(label: 'Reading', icon: Icons.book),
        BottomBarWithSheetItem(label: 'Read', icon: Icons.done),
      ],
    );
  }

  void _handleIndexChanged(int i, BuildContext context) {
    context.read<AppTabBloc>().add(TabChanged(AppTab.values[i]));
  }
}
