import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/saved_params.dart';
import 'package:evo_med/core/util/repository/repository_utils.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/estate_announcement_card_entity.dart';
import 'package:evo_med/features/saved/data/data_sources/saved_datasource.dart';
import 'package:evo_med/features/saved/domain/repositories/saved_repository.dart';

class SavedRepositoryImpl with RepositoryUtil implements SavedRepository {
  final SavedDataSource savedDataSource;

  SavedRepositoryImpl({required this.savedDataSource});

  @override
  Future<Either<Failure, List<EstateAnnouncementCardEntity>>> getSavedList(params) {
    return callSafely(() async {
      var result = await savedDataSource.getSavedList(params);
      return result.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, EstateAnnouncementCardEntity>> addToSaved(SavedParams params) {
    return callSafely(() async {
      final result = await savedDataSource.addToSaved(params);
      return result.toEntity();
    });
  }

  @override
  Future<Either<Failure, void>> deleteSaved(SavedParams params) {
    return callSafely(() async {
      return await savedDataSource.deleteSaved(params);
    });
  }

  @override
  Future<Either<Failure, void>> updateSaved(SavedParams params) {
    return callSafely(() async {
      return await savedDataSource.updateSaved(params);
    });
  }
}
