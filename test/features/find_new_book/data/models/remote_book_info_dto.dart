import 'package:homer/features/find_new_book/data/models/remote_book_info_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils.dart';

void main() {
  group('fromJson', () {
    test('should construct book info DTO from json', () {
      // given
      final json = fakeBookInfoDTOJson();

      // when
      final result = RemoteBookInfoDTO.fromJson(json);

      // then
      expect(result, bookInfoDTOFromJson(json));
    });
  });

  group('toJson', () {
    test('should produce valid json from book info DTO', () {
      // given
      final dto = fakeBookInfoDTO();

      // when
      final json = dto.toJson();

      // then
      expect(json, bookInfoDTOToJson(dto));
    });
  });
}
