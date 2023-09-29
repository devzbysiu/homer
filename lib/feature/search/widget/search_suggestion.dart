import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/use_case/display_suggested_book/suggested_book_bloc.dart';
import 'package:homer/core/utils/extensions.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SearchSuggestion extends StatelessWidget {
  const SearchSuggestion({
    super.key,
    required this.book,
    required this.controller,
  });

  final BookEntity book;

  final FloatingSearchBarController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SizedBox(
          height: 250,
          width: 60,
          child: Image.network(book.thumbnailAddress!, fit: BoxFit.cover),
        ),
        onTap: () => _onTap(context),
        title: Text(book.title),
        subtitle: Text(book.subtitle));
  }

  void _onTap(BuildContext context) {
    context.emitSuggestedBookEvt(SuggestedBookPicked(book));
    controller.close();
  }
}
