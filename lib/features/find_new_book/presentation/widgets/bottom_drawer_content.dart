import 'package:banner_listtile/banner_listtile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/entities/tag.dart';
import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/utils/fallback_img.dart';
import '../../../../core/utils/theme.dart';
import '../../../../core/widgets/book_authors.dart';
import '../../../../core/widgets/book_title.dart';
import '../../../../core/widgets/card_footer.dart';
import '../../../../core/widgets/transparent_image_card.dart';
import '../../../manage_books/presentation/bloc/listing/books_event.dart';
import '../../../tags_manager/presentation/bloc/tags_bloc.dart';
import '../../../tags_manager/presentation/bloc/tags_state.dart';
import '../bloc/search/book_search_bloc.dart';
import '../bloc/search/book_search_event.dart';
import '../bloc/search/book_search_state.dart';
import '../bloc/share_book/share_book_bloc.dart';
import '../bloc/share_book/share_book_state.dart';
import '../bloc/toggle_tags/on_book_tags_bloc.dart';
import 'with_saved_check_mark.dart';

part 'picked_book_area.dart';
part 'savable_book_with_summary.dart';
part 'save_buttons.dart';
part 'search_suggestions.dart';
part 'tags.dart';

class BottomDrawerContent extends StatefulWidget {
  const BottomDrawerContent({super.key});

  @override
  State<BottomDrawerContent> createState() => _BottomDrawerContentState();
}

class _BottomDrawerContentState extends State<BottomDrawerContent> {
  final _controller = SearchController();
  bool _showPanel = false;

  @override
  Widget build(BuildContext context) {
    // top-pinned, non-expanding container so it doesn’t center in the sheet
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // The input (no SearchAnchor route)
          SearchBar(
            controller: _controller,
            hintText: 'Filter...',
            shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            constraints: BoxConstraints(minHeight: 50, maxHeight: 50),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 12),
            ),
            leading: const Icon(Icons.search),
            trailing: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() => _showPanel = false);
                  _controller.clear();
                },
              ),
            ],
            onChanged: (q) {
              context.read<BookSearchBloc>().add(
                SearchEvent.searching(query: q),
              );
              setState(() => _showPanel = q.isNotEmpty);
            },
          ),

          // Inline suggestions panel that never leaves the sheet
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            child: !_showPanel
                ? const SizedBox.shrink()
                : ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 320),
                    child: Material(
                      elevation: 3,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: BlocBuilder<BookSearchBloc, BookSearchState>(
                        builder: (context, state) {
                          final items = state.foundBooks;
                          if (items.isEmpty) {
                            return const SizedBox.shrink();
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, i) {
                              final s = items[i];
                              return ListTile(
                                title: Text(s.title),
                                onTap: () {
                                  setState(() => _showPanel = false);
                                  // close + apply
                                  _controller.text = s.title;
                                  context.read<BookSearchBloc>().add(
                                    SearchEvent.suggestionPicked(pickedBook: s),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
