import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:vibration/vibration.dart';

import '../../../../core/utils/color_mapper.dart';
import '../../../../core/utils/extensions/book_tags_context_ext.dart';
import '../../../../core/utils/extensions/books_context_ext.dart';
import '../../../../core/utils/fallback_img.dart';
import '../../../../core/widgets/book_authors.dart';
import '../../../../core/widgets/book_title.dart';
import '../../../../core/widgets/card_footer.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../../domain/entities/local_book.dart';
import 'swipeable_card.dart';
import 'transparent_image_card.dart';

final class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final LocalBook book;

  @override
  Widget build(BuildContext context) {
    final booksToDelete = context.booksToDelete();
    final isOnDeleteList = booksToDelete.contains(book);
    final isInSummaryMode = context.isInSummaryMode(book);
    return GestureDetector(
      onLongPress: () => _switchToDeleteMode(context),
      onDoubleTap: () => context.showSummary(book),
      onTap: () => _toggleModes(booksToDelete, context),
      child: _bookCard(booksToDelete, isOnDeleteList, isInSummaryMode),
    );
  }

  Widget _bookCard(
    List<LocalBook> booksToDelete,
    bool isOnDeleteList,
    bool isInSummaryMode,
  ) {
    if (booksToDelete.isNotEmpty) {
      return _DeletableCard(
        book: book,
        isOnDeleteList: isOnDeleteList,
      );
    } else if (booksToDelete.isEmpty && !isInSummaryMode) {
      return SwipeableCard(
        book: book,
        child: _ImageCard(book: book),
      );
    } else if (isInSummaryMode) {
      return _SummaryCard(book: book);
    }
    throw Exception('Should not happen');
  }

  void _switchToDeleteMode(BuildContext context) {
    context.appendToDeleteList(book);
    Vibration.vibrate(duration: 100);
  }

  void _toggleModes(List<LocalBook> booksToDelete, BuildContext context) {
    context.disableSummaryMode();
    if (booksToDelete.isEmpty) {
      return;
    }
    final selectedToDelete = booksToDelete.contains(book);
    if (selectedToDelete) {
      context.removeFromDeleteList(book);
      return;
    }
    context.appendToDeleteList(book);
  }
}

final class _DeletableCard extends StatelessWidget {
  const _DeletableCard({
    required this.book,
    required this.isOnDeleteList,
  });

  final LocalBook book;

  final bool isOnDeleteList;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(),
      effects: const [ShakeEffect(rotation: 0.01, hz: 2.5)],
      child: SwipeableCard(
        book: book,
        child: Blur(
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
          child: _ImageCard(book: book),
        ),
      ),
    );
  }
}

const noSummaryText = 'No summary.';

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
      child: SwipeableCard(
        book: book,
        child: Blur(
          colorOpacity: 1.0,
          blur: 0.0,
          overlay: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Text(
                book.summary.fold(
                  () => noSummaryText,
                  (summary) => summary.isEmpty ? noSummaryText : summary,
                ),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          blurColor: Theme.of(context).colorScheme.background,
          child: _ImageCard(book: book),
        ),
      ),
    );
  }
}

final class _ImageCard extends StatelessWidget {
  const _ImageCard({required this.book});

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
          color: toFlutterColor(tag.color),
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
            color: Theme.of(context).primaryColor.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(6),
          color: Theme.of(context).colorScheme.background.withOpacity(0.4),
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
        iconColor: toFlutterColor(tag.color),
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
