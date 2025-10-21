import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/saved_params.dart';
import 'package:evo_med/features/saved/domain/repositories/saved_repository.dart';
import 'package:evo_med/features/saved/domain/entities/saved_entity.dart';

class DeleteSavedUseCase implements UseCase<void, SavedParams> {
  final SavedRepository savedRepository;

  DeleteSavedUseCase({
    required this.savedRepository,
  });

  @override
  Future<Either<Failure, void>> call(SavedParams params) async {
    return await savedRepository.deleteSaved(params);
  }
}
