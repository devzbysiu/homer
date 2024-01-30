import 'package:homer/core/error/exceptions.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/manage_books/data/repositories/books_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('listAll', () {
    test('should use books data source to list books', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      final bookDTOs = [fakeBookDTO(), fakeBookDTO(), fakeBookDTO()];
      when(booksDataSource.getBooks()).thenAnswer((_) => withIt(bookDTOs));
      final repo = BooksRepo(dataSource: booksDataSource);

      verifyZeroInteractions(booksDataSource);

      // when
      final _ = await repo.listAll();

      // then
      verify(booksDataSource.getBooks());
      verifyNoMoreInteractions(booksDataSource);
    });

    test('should return failure when datasource throws', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      when(booksDataSource.getBooks()).thenThrow(ListBooksException());
      final repo = BooksRepo(dataSource: booksDataSource);

      // when
      final result = await repo.listAll();

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, ListingBooksFailure());
    });

    test('should return empty list when datasource returns nothing', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      when(booksDataSource.getBooks()).thenAnswer((_) async => []);
      final repo = BooksRepo(dataSource: booksDataSource);

      // when
      final result = await repo.listAll();

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.isEmpty, true);
    });

    test('should return list of books when datasource returns books', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      when(booksDataSource.getBooks()).thenAnswer((_) async => [fakeBookDTO()]);
      final repo = BooksRepo(dataSource: booksDataSource);

      // when
      final result = await repo.listAll();

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.length, 1);
    });
  });

  group('add', () {
    test('should use datasource to add book', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      final book = fakeBook();
      final bookDTO = bookDTOFromBook(book);
      when(booksDataSource.add(bookDTO)).thenAnswer((_) => withUnit());
      final repo = BooksRepo(dataSource: booksDataSource);

      verifyZeroInteractions(booksDataSource);

      // when
      final _ = await repo.add(book);

      // then
      verify(booksDataSource.add(bookDTO));
      verifyNoMoreInteractions(booksDataSource);
    });

    test('should return failure when datasource throws', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      when(booksDataSource.add(any)).thenThrow(AddBookException());
      final repo = BooksRepo(dataSource: booksDataSource);
      final book = fakeBook();

      // when
      final result = await repo.add(book);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, AddingBookFailure(book));
    });
  });

  group('replaceAll', () {
    test('should return failure when datasource throws', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      when(booksDataSource.replaceAll(any)).thenThrow(ReplaceBooksException());
      final repo = BooksRepo(dataSource: booksDataSource);
      final books = [fakeBook(), fakeBook(), fakeBook()];

      // when
      final result = await repo.replaceAll(books);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, ReplacingBooksFailure(books));
    });

    test('should use datasource to replace books', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      final books = [fakeBook(), fakeBook(), fakeBook()];
      final bookDTOs = books.map(bookDTOFromBook).toList();
      when(booksDataSource.replaceAll(bookDTOs)).thenAnswer((_) => withUnit());
      final repo = BooksRepo(dataSource: booksDataSource);

      verifyZeroInteractions(booksDataSource);

      // when
      final _ = await repo.replaceAll(books);

      // then
      verify(booksDataSource.replaceAll(bookDTOs));
      verifyNoMoreInteractions(booksDataSource);
    });
  });

  group('update', () {
    test('should return failure when datasource throws', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      when(booksDataSource.update(any)).thenThrow(UpdateBookException());
      final repo = BooksRepo(dataSource: booksDataSource);
      final book = fakeBook();

      // when
      final result = await repo.update(book);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, UpdatingBookFailure(book));
    });

    test('should use datasource to replace books', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      final book = fakeBook();
      final bookDTO = bookDTOFromBook(book);
      when(booksDataSource.update(bookDTO)).thenAnswer((_) => withUnit());
      final repo = BooksRepo(dataSource: booksDataSource);

      verifyZeroInteractions(booksDataSource);

      // when
      final _ = await repo.update(book);

      // then
      verify(booksDataSource.update(bookDTO));
      verifyNoMoreInteractions(booksDataSource);
    });
  });

  group('delete', () {
    test('should return failure when datasource throws', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      when(booksDataSource.delete(any)).thenThrow(DeleteBooksException());
      final repo = BooksRepo(dataSource: booksDataSource);
      final books = [fakeBook(), fakeBook(), fakeBook()];

      // when
      final result = await repo.delete(books);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, DeletingBooksFailure(books));
    });

    test('should use datasource to delete books', () async {
      // given
      final booksDataSource = makeMockBooksDatasource();
      final books = [fakeBook(), fakeBook(), fakeBook()];
      final bookDTOs = books.map(bookDTOFromBook).toList();
      when(booksDataSource.delete(bookDTOs)).thenAnswer((_) => withUnit());
      final repo = BooksRepo(dataSource: booksDataSource);

      verifyNoMoreInteractions(booksDataSource);

      // when
      final _ = await repo.delete(books);

      // then
      verify(booksDataSource.delete(bookDTOs));
      verifyNoMoreInteractions(booksDataSource);
    });
  });
}