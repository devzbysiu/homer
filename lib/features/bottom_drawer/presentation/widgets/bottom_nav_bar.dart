import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../injection_container.dart';
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
    context.read<AppTabBloc>().add(TabChanged(AppTab.values[i]));
  }

  void _closeSheetWhenBookSaved() {
    if (!listenerHooked) {
      sl<EventBus>().on<BookSaved>().listen((_) {
        _sheetController.closeSheet();
      });
      listenerHooked = true;
    }
  }
}
