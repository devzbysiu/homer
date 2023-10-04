import 'package:homer/core/error/exceptions.dart';
import 'package:homer/features/books_listing/data/models/book_model.dart';
import 'package:homer/features/books_listing/data/models/tag_model.dart';
import 'package:homer/features/tags_manager/domain/entities/tag.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/book.dart';
import '../../domain/repositories/books_repository.dart';
import '../datasources/local_data_source.dart';

final class LocalBooksRepo implements BooksRepository {
  LocalBooksRepo({required this.localDataSource});

  @override
  Future<Result<Unit, Failure>> add(Book book) async {
    try {
      final bookModels = await localDataSource.getBooks();
      bookModels.add(BookModel(
        title: book.title,
        subtitle: book.subtitle,
        author: book.author,
        state: _toBookModelState(book.state),
        pageCount: book.pageCount,
        isbn: book.isbn,
        thumbnailAddress: book.thumbnailAddress,
        startDate: book.startDate,
        endDate: book.endDate,
        rating: book.rating,
        summary: book.summary,
        tags: _toBookModelTags(book.tags),
      ));
      await localDataSource.saveBooks(bookModels);
      return Future.value(const Success(unit));
    } on LocalDatasourceException {
      return Future.value(Error(LocalDataSourceFailure()));
    }
  }

  @override
  Future<Result<List<Book>, Failure>> listAll() async {
    try {
      final bookModels = await localDataSource.getBooks();
      final books = bookModels
          .map((bookModel) => Book(
                title: bookModel.title,
                subtitle: bookModel.subtitle,
                author: bookModel.author,
                state: _toBookState(bookModel.state),
                pageCount: bookModel.pageCount,
                isbn: bookModel.isbn,
                thumbnailAddress: bookModel.thumbnailAddress,
                startDate: bookModel.startDate,
                endDate: bookModel.endDate,
                rating: bookModel.rating,
                summary: bookModel.summary,
                tags: _toBookTags(bookModel.tags),
              ))
          .toList();
      return Future.value(Success(books));
    } on LocalDatasourceException {
      return Future.value(Error(LocalDataSourceFailure()));
    }
  }

  @override
  Future<Result<List<Book>, Failure>> search(String query) {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit, Failure>> swap(Book book, Book withCopy) {
    // TODO: implement swap
    throw UnimplementedError();
  }

  BookModelState _toBookModelState(BookState state) {
    switch (state) {
      case BookState.readLater:
        return BookModelState.readLater;
      case BookState.reading:
        return BookModelState.reading;
      case BookState.read:
        return BookModelState.read;
    }
  }

  Set<TagModel> _toBookModelTags(Set<Tag> tags) {
    return tags
        .map((tag) => TagModel(
              name: tag.name,
              color: _toTagModelColor(tag.color),
            ))
        .toSet();
  }

  TagModelColor _toTagModelColor(TagColor color) {
    switch (color) {
      case TagColor.brown:
        return TagModelColor.brown;
      case TagColor.black:
        return TagModelColor.black;
      case TagColor.green:
        return TagModelColor.green;
      case TagColor.blue:
        return TagModelColor.blue;
      case TagColor.orange:
        return TagModelColor.orange;
      case TagColor.red:
        return TagModelColor.red;
    }
  }

  BookState _toBookState(BookModelState state) {
    switch (state) {
      case BookModelState.readLater:
        return BookState.readLater;
      case BookModelState.reading:
        return BookState.reading;
      case BookModelState.read:
        return BookState.read;
    }
  }

  Set<Tag> _toBookTags(Set<TagModel> tags) {
    return tags
        .map((tagModel) => Tag(
              name: tagModel.name,
              color: _toTagColor(tagModel.color),
            ))
        .toSet();
  }

  TagColor _toTagColor(TagModelColor color) {
    switch (color) {
      case TagModelColor.brown:
        return TagColor.brown;
      case TagModelColor.black:
        return TagColor.black;
      case TagModelColor.green:
        return TagColor.green;
      case TagModelColor.blue:
        return TagColor.blue;
      case TagModelColor.orange:
        return TagColor.orange;
      case TagModelColor.red:
        return TagColor.red;
    }
  }

  final LocalDataSource localDataSource;
}
