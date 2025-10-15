import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pull_down_button/pull_down_button.dart';

import '../../features/manage_books/presentation/bloc/listing/books_event.dart';
import '../../features/tags_manager/presentation/bloc/tags_bloc.dart';
import '../../features/tags_manager/presentation/bloc/tags_state.dart';
import '../entities/book.dart';
import '../entities/tag.dart';
import '../orchestrator/bus_widget.dart';
import '../utils/theme.dart';

final class BookTitleAndTagTile extends StatelessWidget {
  const BookTitleAndTagTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [_AddTagTile(book: book)]),
        Row(
          children: [
            Expanded(
              child: Text(
                // Adding `'\n'` to have at least two lines
                // (but max lines is 2 so it's always 2 lines)
                '${book.title}\n',
                maxLines: 2,
                style: context.bodyLarge.copyWith(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

final class _AddTagTile extends StatelessBusWidget {
  _AddTagTile({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TagsBloc, TagsState, List<Tag>>(
      selector: (state) => state.tagsOrEmpty,
      builder: (context, tags) {
        return InkWell(
          onTap: () async {
            await showPullDownMenu(
              context: context,
              items: _listTags(tags, context),
              position: context.globalPaintBounds!,
            );
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              border: Border.all(color: context.primary),
              borderRadius: BorderRadius.circular(6),
              color: Colors.black,
            ),
            child: const Icon(Icons.tag, color: Colors.white, size: 15),
          ),
        );
      },
    );
  }

  List<PullDownMenuEntry> _listTags(List<Tag> tags, BuildContext context) {
    return tags.map((tag) {
      return PullDownMenuItem.selectable(
        selected: book.tags.contains(tag),
        onTap: () => fire(TagToggled(book: book, tag: tag)),
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
