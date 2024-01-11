import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/settings.dart';
import '../repositories/settings_repository.dart';

typedef SaveSettings = UseCase<Unit, SettingsParams>;

final class SaveSettingsImpl implements SaveSettings {
  const SaveSettingsImpl(this.repo);

  final SettingsRepository repo;

  @override
  Future<Result<Unit, Failure>> call(SettingsParams params) async {
    return await repo.save(params.settings);
  }
}

final class SettingsParams extends Equatable {
  const SettingsParams({required this.settings});

  final Settings settings;

  @override
  List<Object> get props => [settings];
}
