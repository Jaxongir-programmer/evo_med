import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/repository/repository_utils.dart';
import 'package:evo_med/features/common/data/models/generic_pagination.dart';
import 'package:evo_med/features/estate_announcement/data/data_sources/estate_announcement_datasource.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/estate_announcement_card_entity.dart';
import 'package:evo_med/features/estate_announcement/domain/repositories/estate_announcement_repository.dart';

class EstateAnnouncementRepositoryImpl with RepositoryUtil implements EstateAnnouncementRepository {
  final EstateAnnouncementDataSource estateAnnouncementDataSource;

  EstateAnnouncementRepositoryImpl({required this.estateAnnouncementDataSource});

  @override
  Future<Either<Failure, PaginationList<EstateAnnouncementCardEntity>>> getRealEstateAnnouncement(params) {
    return callSafely(() async {
      final result = await estateAnnouncementDataSource.getRealEstateAnnouncement(params);
      final list = result.result.map((e) => e.toEntity()).toList();
      return PaginationList<EstateAnnouncementCardEntity>(result: list, totalCount: result.totalCount);
    });
  }

  @override
  Future<Either<Failure, int>> getRealEstateAnnouncementCount(params) {
    return callSafely(() async {
      final result = await estateAnnouncementDataSource.getRealEstateAnnouncementCount(params);
      final count = result;
      return count;
    });
  }
}
