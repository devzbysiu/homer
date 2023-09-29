import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/use_case/display_suggested_book/suggested_book_bloc.dart';
import 'package:homer/core/utils/extensions.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: Colors.white,
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: Colors.accents.take(3).map((color) {
            return GestureDetector(
              onTap: () {
                context.emitSuggestedBookEvt(
                  SuggestedBookPicked(BookEntity.fake()),
                );
              },
              child: Container(
                height: 112,
                color: color,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
