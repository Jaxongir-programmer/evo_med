import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/saved_params.dart';
import 'package:evo_med/features/add_announcement/domain/entities/add_announcement_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/estate_announcement_card_entity.dart';
import 'package:evo_med/features/saved/domain/repositories/saved_repository.dart';
import 'package:evo_med/features/saved/domain/entities/saved_entity.dart';

class GetSavedListUseCase implements UseCase<List<EstateAnnouncementCardEntity>, SavedParams> {
  final SavedRepository savedRepository;

  GetSavedListUseCase({
    required this.savedRepository,
  });

  @override
  Future<Either<Failure, List<EstateAnnouncementCardEntity>>> call(SavedParams params) async {
    return await savedRepository.getSavedList(params);
  }
}
