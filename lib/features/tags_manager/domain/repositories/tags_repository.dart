import '../entities/tag_entity.dart';

abstract class TagsRepository {
  List<TagEntity> listAll();
}