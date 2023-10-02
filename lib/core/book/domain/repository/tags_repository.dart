import 'package:homer/core/book/domain/entity/tag_entity.dart';

abstract class TagsRepository {
  List<TagEntity> listAll();
}