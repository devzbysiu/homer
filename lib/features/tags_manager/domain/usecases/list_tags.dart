import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/tag.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/tags_repository.dart';

typedef ListTags = UseCase<List<Tag>, NoParams>;

final class ListTagsImpl implements ListTags {
  ListTagsImpl(this.tagsRepo);

  final TagsRepository tagsRepo;

  @override
  Future<Result<List<Tag>, Failure>> call(NoParams params) async {
    return await tagsRepo.listAll();
  }
}
