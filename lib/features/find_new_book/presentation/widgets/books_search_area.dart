import 'package:banner_listtile/banner_listtile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chip_list/chip_list.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../core/utils/fallback_img.dart';
import '../../../../core/widgets/book_authors.dart';
import '../../../../core/widgets/book_title.dart';
import '../../../../core/widgets/card_footer.dart';
import '../../../../core/widgets/transparent_image_card.dart';
import '../../../manage_books/domain/entities/local_book.dart';
import '../../../manage_books/presentation/bloc/listing/books_bloc.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../../../tags_manager/presentation/bloc/tags_bloc.dart';
import '../../domain/entities/remote_book.dart';
import '../bloc/search/book_search_bloc.dart';
import '../bloc/toggle_tags/on_book_tags_bloc.dart';

final class BookSearchArea extends StatefulWidget {
  const BookSearchArea({super.key});

  @override
  State<BookSearchArea> createState() => _BookSearchAreaState();
}

class _BookSearchAreaState extends State<BookSearchArea> {
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
          body: const _BottomSheetContent(),
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
          actions: _actions(),
          builder: (_, __) => const _SearchSuggestions(),
        );
      },
    );
  }

  List<Widget> _actions() {
    return [
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

final class _BottomSheetContent extends StatelessWidget {
  const _BottomSheetContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookSearchBloc, BookSearchState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case FetchingSharedBookDetails:
            return const _SearchProgressIndicator();
          case FailedToLookUpSharedBook:
            return const _SearchError();
          default:
            return const _SavableBookWithSummary();
        }
      },
    );
  }
}

final class _SavableBookWithSummary extends StatelessWidget {
  const _SavableBookWithSummary();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookSearchBloc, BookSearchState,
        dartz.Option<RemoteBook>>(
      selector: (state) => state.pickedBook,
      builder: (context, pickedBook) {
        return pickedBook.fold(
          () => Container(),
          (book) => Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Stack(
              children: [
                _BookWithSummary(pickedBook: book),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 60,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: _Tags(),
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 10,
                  child: _SaveButtons(pickedBook: book),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

final class _BookWithSummary extends StatelessWidget {
  const _BookWithSummary({required this.pickedBook});

  final RemoteBook pickedBook;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 9, right: 9),
      child: DropCapText(
        pickedBook.description,
        maxLines: 23,
        overflow: TextOverflow.ellipsis,
        dropCap: DropCap(
          width: 200,
          height: 280,
          child: _RemoteBookCard(book: pickedBook),
        ),
        dropCapPadding: const EdgeInsets.only(
          bottom: 5,
          right: 15,
        ),
      ),
    );
  }
}

final class _RemoteBookCard extends StatelessWidget {
  const _RemoteBookCard({required this.book});

  final RemoteBook book;

  @override
  Widget build(BuildContext context) {
    return TransparentImageCard(
      contentMarginTop: 183,
      height: 280,
      imageProvider: _imageProvider() as ImageProvider<Object>,
      tags: const [],
      title: BookTitle(title: book.title),
      endColor: Colors.black,
      description: BookAuthors(authorNames: book.authors),
      footer: BookCardFooter(
        rating: book.averageRating,
        pageCount: book.pageCount,
      ),
    );
  }

  Object _imageProvider() {
    return book.thumbnail.fold(
      () => coverFallbackAssetImage(),
      (thumbnail) => CachedNetworkImageProvider(thumbnail.toString()),
    );
  }
}

final class _SaveButtons extends StatelessWidget {
  const _SaveButtons({required this.pickedBook});

  final RemoteBook pickedBook;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () => _addBook(
            context,
            pickedBook,
            LocalBookState.readLater,
          ),
          color: Theme.of(context).colorScheme.secondary,
          icon: const Icon(Icons.bookmark),
        ),
        IconButton(
          onPressed: () => _addBook(
            context,
            pickedBook,
            LocalBookState.reading,
          ),
          color: Theme.of(context).colorScheme.secondary,
          icon: const Icon(Icons.book),
        ),
        IconButton(
          onPressed: () => _addBook(
            context,
            pickedBook,
            LocalBookState.read,
          ),
          color: Theme.of(context).colorScheme.secondary,
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }

  void _addBook(
    BuildContext context,
    RemoteBook pickedBook,
    LocalBookState bookState,
  ) {
    final selectedTags = context.selectedTags();
    context.addBook(pickedBook, bookState, selectedTags);
    context.clearPickedBook();
    context.clearSelectedTags();
  }
}

final class _Tags extends StatefulWidget {
  const _Tags();

  @override
  State<_Tags> createState() => _TagsState();
}

final class _TagsState extends State<_Tags> {
  final Set<int> _selectedTagIndices = {};

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TagsBloc, TagsState, List<Tag>>(
      selector: (state) => state.tags,
      builder: (context, tags) {
        return ChipList(
          supportsMultiSelect: true,
          listOfChipNames: tags.map((tag) => tag.name).toList(),
          extraOnToggle: (idx) => _tagSelected(context, idx, tags),
          listOfChipIndicesCurrentlySeclected: _selectedTagIndices.toList(),
          inactiveBgColorList: _inactiveColors(context, tags),
          inactiveBorderColorList: _tagColors(tags),
          inactiveTextColorList: _inactiveText(context, tags),
          activeBgColorList: _tagColors(tags),
          activeTextColorList: _whiteColors(tags),
        );
      },
    );
  }

  List<Color> _tagColors(List<Tag> tags) {
    return tags.map((tag) => HexColor(tag.hexColor)).toList();
  }

  List<Color> _inactiveText(BuildContext context, List<Tag> tags) {
    return tags.map((_) => Theme.of(context).colorScheme.onBackground).toList();
  }

  List<Color> _whiteColors(List<Tag> tags) {
    return tags.map((_) => Colors.white).toList();
  }

  void _tagSelected(BuildContext context, int idx, List<Tag> tags) {
    if (_selectedTagIndices.contains(idx)) {
      context.deselectTag(tags[idx]);
      _selectedTagIndices.remove(idx);
    } else {
      context.selectTag(tags[idx]);
      _selectedTagIndices.add(idx);
    }
    setState(() {});
  }

  List<Color> _inactiveColors(BuildContext context, List<Tag> tags) {
    return tags.map((_) => Theme.of(context).colorScheme.background).toList();
  }
}

final class _SearchError extends StatelessWidget {
  const _SearchError();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookSearchBloc, BookSearchState>(
        builder: (context, state) {
      if (state is! FailedToLookUpSharedBook) return const Placeholder();
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 80,
            color: Theme.of(context).colorScheme.error,
          ),
          Text(
            state.cause,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          )
        ],
      );
    });
  }
}

final class _SearchProgressIndicator extends StatelessWidget {
  const _SearchProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

final class _SearchSuggestions extends StatelessWidget {
  const _SearchSuggestions();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 470 - MediaQuery.of(context).viewInsets.bottom,
      child: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Theme.of(context).listTileTheme.tileColor,
            elevation: 4.0,
            child: const _SuggestionsList(),
          ),
        ),
      ),
    );
  }
}

class _SuggestionsList extends StatelessWidget {
  const _SuggestionsList();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BookSearchBloc, BookSearchState, List<RemoteBook>>(
      selector: (state) => state.foundBooks,
      builder: (context, foundBooks) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: _searchSuggestions(foundBooks),
        );
      },
    );
  }

  List<Widget> _searchSuggestions(List<RemoteBook> foundBooks) {
    return foundBooks.map((book) {
      return _SearchSuggestion(book: book);
    }).toList();
  }
}

final class _SearchSuggestion extends StatelessWidget {
  const _SearchSuggestion({required this.book});

  final RemoteBook book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 3,
        child: BannerListTile(
          bannerTextColor: Theme.of(context).colorScheme.background,
          bannerColor: Theme.of(context).primaryColor,
          bannerText: book.averageRating.toStringAsFixed(2),
          onTap: () => context.pickSuggestedBook(book),
          backgroundColor: Theme.of(context).listTileTheme.tileColor,
          borderRadius: BorderRadius.circular(8),
          imageContainer: _ListTileThumbnail(book: book),
          title: Text(
            book.title,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            'by ${book.authors.join(', ')}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}

final class _ListTileThumbnail extends StatelessWidget {
  const _ListTileThumbnail({required this.book});

  final RemoteBook book;

  @override
  Widget build(BuildContext context) {
    return book.thumbnail.fold(
      () => fallbackThumbnail(),
      (thumbnail) => FadeInImage(
        image: CachedNetworkImageProvider(
          thumbnail.toString(),
        ),
        placeholder: thumbnailFallbackAssetImage(),
        fit: BoxFit.cover,
        imageErrorBuilder: (_, __, ___) => fallbackThumbnail(),
      ),
    );
  }
}
