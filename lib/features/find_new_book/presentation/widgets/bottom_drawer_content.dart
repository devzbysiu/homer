import 'package:banner_listtile/banner_listtile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chip_list/chip_list.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/entities/tag.dart';
import '../../../../core/utils/fallback_img.dart';
import '../../../../core/widgets/book_authors.dart';
import '../../../../core/widgets/book_title.dart';
import '../../../../core/widgets/card_footer.dart';
import '../../../../core/widgets/transparent_image_card.dart';
import '../../../manage_books/presentation/bloc/listing/books_bloc.dart';
import '../../../tags_manager/presentation/bloc/tags_bloc.dart';
import '../bloc/search/book_search_bloc.dart';
import '../bloc/toggle_tags/on_book_tags_bloc.dart';

part 'picked_book_area.dart';
part 'savable_book_with_summary.dart';
part 'save_buttons.dart';
part 'search_suggestions.dart';
part 'tags.dart';

final class BottomDrawerContent extends StatefulWidget {
  const BottomDrawerContent({super.key});

  @override
  State<BottomDrawerContent> createState() => _BottomDrawerContentState();
}

class _BottomDrawerContentState extends State<BottomDrawerContent> {
  final FloatingSearchBarController _controller = FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookSearchBloc, BookSearchState>(
      builder: (context, state) {
        if (state is BookPicked) _controller.close();
        return FloatingSearchBar(
          accentColor: Theme.of(context).primaryColor,
          progress: state.isSearchInProgress,
          controller: _controller,
          body: const _PickedBookArea(),
          backgroundColor: Theme.of(context).colorScheme.background.lighten(10),
          backdropColor: Colors.transparent,
          hint: 'Search...',
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 600),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          axisAlignment: 0.0,
          openAxisAlignment: 0.0,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) => context.initiateSearch(query),
          transition: CircularFloatingSearchBarTransition(),
          actions: [FloatingSearchBarAction.searchToClear(showIfClosed: false)],
          builder: (_, __) => const _SearchSuggestions(),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
