import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import 'package:vibration/vibration.dart';

import '../../../../core/utils/fallback_img.dart';
import '../../../../core/widgets/book_authors.dart';
import '../../../../core/widgets/book_title.dart';
import '../../../../core/widgets/card_footer.dart';
import '../../../../core/widgets/transparent_image_card.dart';
import '../../../navigation/presentation/bloc/app_tab_bloc.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../../../tags_manager/presentation/bloc/tags_bloc.dart';
import '../../domain/entities/local_book.dart';
import '../bloc/delete/delete_books_bloc.dart';
import '../bloc/listing/books_bloc.dart';
import '../bloc/summary/book_summary_bloc.dart';

part 'animated_regular_card.dart';
part 'animated_summary_card.dart';
part 'book_card.dart';
part 'book_cover.dart';
part 'deletable_card.dart';
part 'regular_card.dart';
part 'swipeable_card.dart';

final class BooksList extends StatefulWidget {
  const BooksList({super.key});

  @override
  State<BooksList> createState() => _BooksListState();
}

final class _BooksListState extends State<BooksList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        _refreshWhenBooksRemoved(),
        _jumpToTopOnTabChange(),
      ],
      child: GestureDetector(
        onTap: () => context.clearDeletionList(),
        child: FloatingSearchBarScrollNotifier(
          child: BlocSelector<BooksBloc, BooksState, List<LocalBook>>(
            selector: (state) => state.books,
            builder: (context, allBooks) {
              final books = allBooks
                  .where((b) => b.state.name == context.currentTab().name)
                  .toList();
              if (books.isEmpty) return Container();
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.78,
                  crossAxisCount: 2,
                ),
                controller: _scrollController,
                itemCount: books.length,
                itemBuilder: (_, index) => _BookCard(book: books[index]),
              );
            },
          ),
        ),
      ),
    );
  }

  BlocListener<DeleteBooksBloc, DeleteBooksState> _refreshWhenBooksRemoved() {
    return BlocListener<DeleteBooksBloc, DeleteBooksState>(
      listener: (_, state) {
        if (state is BooksRemoved) context.refreshBooksList();
      },
    );
  }

  BlocListener<AppTabBloc, AppTabState> _jumpToTopOnTabChange() {
    return BlocListener<AppTabBloc, AppTabState>(
      listener: (_, state) => _scrollController.jumpTo(0),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
