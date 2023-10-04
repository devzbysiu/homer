import '../../domain/entities/book_entity.dart';
import '../../domain/repositories/books_repository.dart';

final class InMemoryBooksRepo extends BooksRepository {
  final _allBooks = [
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
  ];

  final _foundBooks = [
    BookEntity.fake(withTags: false),
    BookEntity.fake(withTags: false),
    BookEntity.fake(withTags: false),
    BookEntity.fake(withTags: false),
    BookEntity.fake(withTags: false),
  ];

  @override
  List<BookEntity> listAll() => List.of(_allBooks);

  @override
  void add(BookEntity book) => _allBooks.add(book);

  @override
  void swap(BookEntity book, BookEntity withCopy) {
    _allBooks.remove(book);
    _allBooks.add(withCopy);
  }

  @override
  List<BookEntity> search(String query) => List.of(_foundBooks);
}
