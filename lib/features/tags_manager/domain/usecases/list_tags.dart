import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/tag.dart';
import '../repositories/tags_repository.dart';

final class ListTags extends UseCase<List<Tag>, NoParams> {
  ListTags(this.tagsRepo);

  @override
  Future<Result<List<Tag>, Failure>> call(NoParams params) async {
    return await tagsRepo.listAll();
  }

  final TagsRepository tagsRepo;
}
