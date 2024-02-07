import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/external_book_info.dart';
import '../repositories/external_book_info_repository.dart';

typedef FetchSharedBookInfo = UseCase<ExternalBookInfo, FetchInfoParams>;

final class FetchSharedBookInfoImpl implements FetchSharedBookInfo {
  FetchSharedBookInfoImpl(this.bookInfoRepo);

  final ExternalBookInfoRepository bookInfoRepo;

  @override
  Future<Result<ExternalBookInfo, Failure>> call(FetchInfoParams params) async {
    return bookInfoRepo.fromUrl(params.url);
  }
}

final class FetchInfoParams extends Equatable {
  const FetchInfoParams({required this.url});

  final String url;

  @override
  List<Object> get props => [url];
}
