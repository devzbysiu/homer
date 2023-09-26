import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/repository/book_repository.dart';
import 'package:homer/main.dart';

class BooksList extends StatelessWidget {
  BooksList({super.key});

  final BookRepository _bookRepo = getIt<BookRepository>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _bookCards(),
    );
  }

  List<Widget> _bookCards() {
    return _bookRepo.findAll().map(_toBookCard).toList();
  }

  Widget _toBookCard(BookEntity book) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(100),
        child: Text(book.title),
      ),
    );
  }
}
