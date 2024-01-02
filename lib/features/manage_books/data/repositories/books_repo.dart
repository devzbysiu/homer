import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/books_repository.dart';
import '../datasources/books_data_source.dart';
import '../mappers/to_book_dtos.dart';
import '../mappers/to_books.dart';

final class BooksRepo implements BooksRepository {
  BooksRepo({required this.dataSource});

  final BooksDataSource dataSource;

  @override
  Future<Result<List<Book>, Failure>> listAll() async {
    try {
      final bookDTOs = await dataSource.getBooks();
      final books = toBooks(bookDTOs);
      return Future.value(Success(books));
    } on ListBooksException {
      return Future.value(Error(ListingBooksFailure()));
    }
  }

  @override
  Future<Result<Unit, Failure>> add(Book book) async {
    try {
      final bookDTO = toBookDTO(book);
      await dataSource.add(bookDTO);
      return Future.value(const Success(unit));
    } on AddBookException {
      return Future.value(Error(AddingBookFailure(book)));
    }
  }

  @override
  Future<Result<Unit, Failure>> replaceAll(List<Book> books) async {
    try {
      final bookDTOs = toBookDTOs(books);
      await dataSource.replaceAll(bookDTOs);
      return Future.value(const Success(unit));
    } on ReplaceBooksException {
      return Future.value(Error(ReplacingBooksFailure(books)));
    }
  }

  @override
  Future<Result<Unit, Failure>> update(Book modified) async {
    try {
      final bookDTO = toBookDTO(modified);
      await dataSource.update(bookDTO);
      return Future.value(const Success(unit));
    } on UpdateBookException {
      return Future.value(Error(UpdatingBookFailure(modified)));
    }
  }

  @override
  Future<Result<Unit, Failure>> delete(List<Book> books) async {
    try {
      final bookDTOs = toBookDTOs(books);
      await dataSource.delete(bookDTOs);
      return Future.value(const Success(unit));
    } on DeleteBooksException {
      return Future.value(Error(DeletingBooksFailure(books)));
    }
  }
}
