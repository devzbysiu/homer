import 'package:multiple_result/src/result.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/tag_entity.dart';
import '../repositories/tags_repository.dart';

final class ListTags extends UseCase<List<TagEntity>, NoParams> {
  ListTags(this.tagsRepo);

  @override
  Future<Result<List<TagEntity>, Failure>> call(NoParams params) async {
    return await tagsRepo.listAll();
  }

  final TagsRepository tagsRepo;
}
