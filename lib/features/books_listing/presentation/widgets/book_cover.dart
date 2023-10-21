import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

import '../../../../core/utils/color_mapper.dart';
import '../../../../core/utils/extensions/book_tags_context_ext.dart';
import '../../../../core/utils/extensions/books_context_ext.dart';
import '../../../../core/utils/fallback_img.dart';
import '../../../../core/widgets/book_authors.dart';
import '../../../../core/widgets/book_title.dart';
import '../../../../core/widgets/card_footer.dart';
import '../../../book_summary/domain/entities/local_book.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import 'transparent_image_card.dart';

final class BookCover extends StatelessWidget {
  const BookCover({super.key, required this.book});

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
