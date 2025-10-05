import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../models/book_dto.dart';
import '../models/tag_dto.dart';

part 'app_database.g.dart';

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();
  TextColumn get subtitle => text()();

  // Enum storage (index-based)
  IntColumn get state => intEnum<BookStateDTO>()();

  IntColumn get pageCount => integer()();

  TextColumn get isbn => text().nullable()();

  TextColumn get thumbnailAddress => text().nullable()();

  // SQLite 'REAL' maps to double
  RealColumn get rating => real()();

  TextColumn get summary => text().nullable()();

  // Store epoch millis as int
  IntColumn get startDate => integer().nullable()();
  IntColumn get endDate => integer().nullable()();
}

class Authors extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
}

class BookAuthors extends Table {
  IntColumn get bookId =>
      integer().references(Books, #id, onDelete: KeyAction.cascade)();
  IntColumn get authorId =>
      integer().references(Authors, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {bookId, authorId};
}

class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get hexColor => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {name},
  ];
}

class BookTags extends Table {
  IntColumn get bookId =>
      integer().references(Books, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId =>
      integer().references(Tags, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {bookId, tagId};
}

@DriftDatabase(tables: [Books, Authors, BookAuthors, Tags, BookTags])
class AppDatabase extends _$AppDatabase {
  AppDatabase._(super.e);
  factory AppDatabase() => AppDatabase._(_openConnection());

  @override
  int get schemaVersion => 1;

  // ------------ INSERT ------------

  /// Inserts (or upserts) a full BookDTO with authors and tags.
  Future<int> insertBookDTO(BookDTO dto) => transaction(() async {
    final bookId = await into(books).insert(
      BooksCompanion.insert(
        title: dto.title,
        subtitle: dto.subtitle,
        state: dto.state,
        pageCount: dto.pageCount,
        // turn empty to null
        isbn: Value(dto.isbn.trim().isEmpty ? null : dto.isbn.trim()),
        thumbnailAddress: Value(dto.thumbnailAddress),
        rating: dto.rating,
        summary: Value(dto.summary),
        startDate: Value(dto.startDate),
        endDate: Value(dto.endDate),
      ),
    );

    // authors
    for (final a in dto.authors) {
      final authorId = await _getOrCreateAuthor(a);
      await into(bookAuthors).insert(
        BookAuthorsCompanion.insert(bookId: bookId, authorId: authorId),
        mode: InsertMode.insertOrIgnore,
      );
    }

    // tags
    for (final t in dto.tags) {
      final tagId = await _getOrCreateTag(t);
      await into(bookTags).insert(
        BookTagsCompanion.insert(bookId: bookId, tagId: tagId),
        mode: InsertMode.insertOrIgnore,
      );
    }

    return bookId;
  });

  // Helper upserts
  Future<int> _getOrCreateAuthor(String name) async {
    final existing = await (select(
      authors,
    )..where((t) => t.name.equals(name))).getSingleOrNull();
    if (existing != null) return existing.id;
    return into(authors).insert(AuthorsCompanion.insert(name: name));
  }

  Future<int> _getOrCreateTag(TagDTO tag) async {
    // Prefer uniqueness by name
    final existing = await (select(
      tags,
    )..where((t) => t.name.equals(tag.name))).getSingleOrNull();
    if (existing != null) return existing.id;
    return into(
      tags,
    ).insert(TagsCompanion.insert(name: tag.name, hexColor: tag.hexColor));
  }

  // ------------ UPDATE ------------

  Future<void> updateBookDTO(BookDTO dto) => transaction(() async {
    if (dto.id == null) {
      throw ArgumentError('updateBookDTO requires dto.id');
    }

    await (update(books)..where((b) => b.id.equals(dto.id!))).write(
      BooksCompanion(
        title: Value(dto.title),
        subtitle: Value(dto.subtitle),
        state: Value(dto.state),
        pageCount: Value(dto.pageCount),
        isbn: Value(dto.isbn.trim().isEmpty ? null : dto.isbn.trim()),
        thumbnailAddress: Value(dto.thumbnailAddress),
        rating: Value(dto.rating),
        summary: Value(dto.summary),
        startDate: Value(dto.startDate),
        endDate: Value(dto.endDate),
      ),
    );

    // Replace authors
    await (delete(bookAuthors)..where((ba) => ba.bookId.equals(dto.id!))).go();
    for (final a in dto.authors) {
      final authorId = await _getOrCreateAuthor(a);
      await into(bookAuthors).insert(
        BookAuthorsCompanion.insert(bookId: dto.id!, authorId: authorId),
        mode: InsertMode.insertOrIgnore,
      );
    }

    // Replace tags
    await (delete(bookTags)..where((bt) => bt.bookId.equals(dto.id!))).go();
    for (final t in dto.tags) {
      final tagId = await _getOrCreateTag(t);
      await into(bookTags).insert(
        BookTagsCompanion.insert(bookId: dto.id!, tagId: tagId),
        mode: InsertMode.insertOrIgnore,
      );
    }
  });

  // ------------ READ ------------

  /// Get one book with authors and tags aggregated into DTO.
  Future<BookDTO?> getBookDTO(int id) async {
    final b = await (select(
      books,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (b == null) return null;

    final authRows = await (select(authors).join([
      innerJoin(bookAuthors, bookAuthors.authorId.equalsExp(authors.id)),
    ])..where(bookAuthors.bookId.equals(id))).get();
    final authorNames = authRows.map((r) => r.readTable(authors).name).toList();

    final tagRows = await (select(tags).join([
      innerJoin(bookTags, bookTags.tagId.equalsExp(tags.id)),
    ])..where(bookTags.bookId.equals(id))).get();
    final dtoTags = tagRows
        .map((r) => r.readTable(tags))
        .map((t) => TagDTO(name: t.name, hexColor: t.hexColor))
        .toList();

    return BookDTO(
      id: b.id,
      title: b.title,
      subtitle: b.subtitle,
      authors: authorNames,
      state: b.state,
      pageCount: b.pageCount,
      isbn: b.isbn ?? '',
      thumbnailAddress: b.thumbnailAddress,
      rating: b.rating,
      summary: b.summary,
      tags: dtoTags,
      startDate: b.startDate,
      endDate: b.endDate,
    );
  }

  /// Simple listing: returns all books; join for authors and tags as needed.
  Future<List<BookDTO>> getAllBookDTOs() async {
    final rows = await select(books).get();
    final result = <BookDTO>[];
    for (final b in rows) {
      result.add(await getBookDTO(b.id) as BookDTO);
    }
    return result;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app.sqlite'));
    return NativeDatabase(file);
  });
}
