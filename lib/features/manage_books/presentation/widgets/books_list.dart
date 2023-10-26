import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

final class _BookCard extends StatelessWidget {
  const _BookCard({required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DeleteBooksBloc, DeleteBooksState, List<LocalBook>>(
      selector: (state) => state.deletionList,
      builder: (context, booksToDelete) {
        return GestureDetector(
          onLongPress: () => _switchToDeleteMode(context),
          onDoubleTap: () => context.toggleSummaryMode(book),
          onTap: () => _toggleModes(booksToDelete, context),
          child: _bookCard(booksToDelete),
        );
      },
    );
  }

  void _switchToDeleteMode(BuildContext context) {
    context.appendToDeleteList(book);
    Vibration.vibrate(duration: 100);
  }

  void _toggleModes(List<LocalBook> booksToDelete, BuildContext context) {
    context.disableSummaryMode();
    if (booksToDelete.isEmpty) return; // not in delete mode
    if (booksToDelete.contains(book)) {
      context.removeFromDeleteList(book);
      return;
    }
    context.appendToDeleteList(book);
  }

  Widget _bookCard(List<LocalBook> booksToDelete) {
    if (booksToDelete.isNotEmpty) return _DeletableCard(book: book);
    return BlocSelector<BookSummaryBloc, BookSummaryState, bool>(
      selector: (state) => state.bookInSummaryMode
          .map((bookInSummaryMode) => book == bookInSummaryMode)
          .getOrElse(() => false),
      builder: (context, isInSummaryMode) {
        if (isInSummaryMode) return _SummaryCard(book: book);
        return _SwipeableCard(
          book: book,
          child: _BookCover(book: book),
        );
      },
    );
  }
}

final class _DeletableCard extends StatelessWidget {
  const _DeletableCard({required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: const [ShakeEffect(rotation: 0.01, hz: 2.5)],
      child: _SwipeableCard(
        book: book,
        child: BlocSelector<DeleteBooksBloc, DeleteBooksState, bool>(
          selector: (state) => state.deletionList.contains(book),
          builder: (context, isOnDeleteList) {
            return Blur(
              colorOpacity: isOnDeleteList ? 0.8 : 0.0,
              blur: 0.0,
              overlay: Center(
                child: isOnDeleteList
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).iconTheme.color,
                        size: 35,
                      )
                    : null,
              ),
              blurColor: Theme.of(context).colorScheme.error,
              child: _BookCover(book: book),
            );
          },
        ),
      ),
    );
  }
}

const _noSummaryText = 'No summary.';

final class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FlipEffect(
          direction: Axis.horizontal,
        ),
      ],
      child: _SwipeableCard(
        book: book,
        child: Blur(
          colorOpacity: 1.0,
          blur: 0.0,
          overlay: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Text(
                book.summary.fold(
                  () => _noSummaryText,
                  (summary) => summary.isEmpty ? _noSummaryText : summary,
                ),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          blurColor: Theme.of(context).colorScheme.background,
          child: _BookCover(book: book),
        ),
      ),
    );
  }
}

final class _BookCover extends StatelessWidget {
  const _BookCover({required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return TransparentImageCard(
      height: 250,
      imageProvider: _imageProvider() as ImageProvider<Object>,
      tags: [_AddTagTile(book: book), ..._tags()],
      endColor: Colors.black,
      title: BookTitle(title: book.title),
      description: BookAuthors(authorNames: book.authors),
      footer: BookCardFooter(
        rating: book.rating,
        pageCount: book.pageCount,
      ),
    );
  }

  Object _imageProvider() {
    return book.thumbnailAddress.fold(
      () => coverFallbackAssetImage(),
      (thumbnailAddress) => CachedNetworkImageProvider(thumbnailAddress),
    );
  }

  List<Widget> _tags() {
    return book.tags.map((tag) => _Tag(tag: tag)).toList();
  }
}

final class _Tag extends StatelessWidget {
  const _Tag({required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: HexColor(tag.hexColor),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        child: Text(
          tag.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

final class _AddTagTile extends StatelessWidget {
  const _AddTagTile({required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    final tags = context.allTags();
    return InkWell(
      onTap: () async {
        await showPullDownMenu(
          context: context,
          items: _listTags(tags, context),
          position: context.globalPaintBounds!,
        );
      },
      child: Container(
        width: 60,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(6),
          color: Colors.black,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        child: const Icon(
          Icons.tag,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }

  List<PullDownMenuEntry> _listTags(List<Tag> tags, BuildContext context) {
    return tags.map((tag) {
      return PullDownMenuItem.selectable(
        selected: book.tags.contains(tag),
        onTap: () => context.toggleTag(book, tag),
        title: tag.name,
        icon: Icons.circle,
        iconColor: HexColor(tag.hexColor),
      );
    }).toList();
  }
}

extension _GlobalPaintBounds on BuildContext {
  Rect? get globalPaintBounds {
    final renderObject = findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}

final class _SwipeableCard extends StatelessWidget {
  const _SwipeableCard({required this.child, required this.book});

  final Widget child;

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    return SwipeableTile.swipeToTriggerCard(
      color: Theme.of(context).cardColor,
      shadow: const BoxShadow(),
      horizontalPadding: 10,
      verticalPadding: 10,
      borderRadius: 8,
      direction: SwipeDirection.horizontal,
      onSwiped: (direction) => _onSwiped(context, direction),
      backgroundBuilder: _animatedBackground,
      key: UniqueKey(),
      child: child,
    );
  }

  void _onSwiped(BuildContext context, SwipeDirection direction) {
    if (_swipingToRight(direction) && _canSwipeRight()) {
      _showSnackbarOnRightSwipe(context);
      context.bookSwipedRight(book);
    } else if (_swipingToLeft(direction) && _canSwipeLeft()) {
      _showSnackbarOnLeftSwipe(context);
      context.bookSwipedLeft(book);
    }
  }

  bool _swipingToRight(SwipeDirection direction) {
    return direction == SwipeDirection.startToEnd;
  }

  bool _swipingToLeft(SwipeDirection direction) {
    return direction == SwipeDirection.endToStart;
  }

  bool _canSwipeRight() {
    return book.state != LocalBookState.read;
  }

  bool _canSwipeLeft() {
    return book.state != LocalBookState.readLater;
  }

  void _showSnackbarOnRightSwipe(BuildContext context) {
    switch (book.state) {
      case LocalBookState.readLater:
        _showSnackbar(context, 'Book moved to Reading!');
        return;
      case LocalBookState.reading:
        _showSnackbar(context, 'Book moved to Read!');
        return;
      case LocalBookState.read:
        return;
    }
  }

  void _showSnackbar(BuildContext context, String msg) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        color: Theme.of(context).colorScheme.primaryContainer,
        messageFontSize: 18,
        title: 'Yay!',
        message: msg,
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void _showSnackbarOnLeftSwipe(BuildContext context) {
    switch (book.state) {
      case LocalBookState.readLater:
        return;
      case LocalBookState.reading:
        _showSnackbar(context, 'Book moved to Read Later!');
        return;
      case LocalBookState.read:
        _showSnackbar(context, 'Book moved to Reading!');
        return;
    }
  }

  Widget _animatedBackground(
    BuildContext _,
    SwipeDirection direction,
    AnimationController progress,
  ) {
    return _AnimatedBackground(
      progress: progress,
      direction: direction,
      currentState: book.state,
    );
  }
}

final class _AnimatedBackground extends StatelessWidget {
  const _AnimatedBackground({
    required this.progress,
    required this.direction,
    required this.currentState,
  });

  final AnimationController progress;

  final SwipeDirection direction;

  final LocalBookState currentState;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (_, __) {
        if (_swipingToRight()) {
          return _animateRightSwipe(context);
        }
        return _animateLeftSwipe(context);
      },
    );
  }

  bool _swipingToRight() {
    return direction == SwipeDirection.startToEnd;
  }

  Widget _animateRightSwipe(BuildContext context) {
    switch (currentState) {
      case LocalBookState.readLater:
        return _animateToReadingRight(context);
      case LocalBookState.reading:
        return _animateToRead(context);
      case LocalBookState.read:
        return Container();
    }
  }

  Widget _animateToReadingRight(BuildContext context) {
    return _animateTo(
      Icons.book,
      progress,
      MainAxisAlignment.start,
      const EdgeInsets.only(left: 30),
    );
  }

  Widget _animateTo(
    IconData icon,
    AnimationController progress,
    MainAxisAlignment alignment,
    EdgeInsets padding,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Padding(
            padding: padding,
            child: Icon(icon),
          ),
        ],
      ),
    );
  }

  Widget _animateToRead(BuildContext context) {
    return _animateTo(
      Icons.done,
      progress,
      MainAxisAlignment.start,
      const EdgeInsets.only(left: 30),
    );
  }

  Widget _animateLeftSwipe(BuildContext context) {
    switch (currentState) {
      case LocalBookState.readLater:
        return Container();
      case LocalBookState.reading:
        return _animateToForLater(context);
      case LocalBookState.read:
        return _animateToReadingLeft(context);
    }
  }

  Widget _animateToForLater(BuildContext context) {
    return _animateTo(
      Icons.bookmark,
      progress,
      MainAxisAlignment.end,
      const EdgeInsets.only(right: 30),
    );
  }

  Widget _animateToReadingLeft(BuildContext context) {
    return _animateTo(
      Icons.book,
      progress,
      MainAxisAlignment.end,
      const EdgeInsets.only(right: 30),
    );
  }
}
