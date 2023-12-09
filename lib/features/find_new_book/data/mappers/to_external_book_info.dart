import '../../domain/entities/external_book_info.dart';
import '../models/external_book_info_dto.dart';

ExternalBookInfo toExternalBookInfo(ExternalBookInfoDTO dto) {
  return ExternalBookInfo(
    isbn: dto.isbn.toNullable()!,
    title: dto.title,
  );
}
