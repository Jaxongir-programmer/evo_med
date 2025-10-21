import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/saved_params.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/estate_announcement_card_entity.dart';

abstract class SavedRepository {
  Future<Either<Failure, List<EstateAnnouncementCardEntity>>> getSavedList(SavedParams params);

  Future<Either<Failure, EstateAnnouncementCardEntity>> addToSaved(SavedParams params);

  Future<Either<Failure, void>> deleteSaved(SavedParams params);

  Future<Either<Failure, void>> updateSaved(SavedParams params);
}
    