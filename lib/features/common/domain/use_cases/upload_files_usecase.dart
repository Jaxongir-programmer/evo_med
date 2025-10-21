import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/common/domain/repository/common_repository.dart';

class UploadFilesUseCase extends UseCase<List<String>, List<String>> {
  final CommonRepository repository;

  UploadFilesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<String>>> call(List<String> params) async {
    return await repository.uploadFile(params);
  }
}
