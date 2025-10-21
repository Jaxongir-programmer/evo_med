import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/real_estate_params.dart';
import 'package:evo_med/features/common/data/models/generic_pagination.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/estate_announcement_card_entity.dart';

abstract class EstateAnnouncementRepository {
  Future<Either<Failure, PaginationList<EstateAnnouncementCardEntity>>> getRealEstateAnnouncement(
      RealEstateParams params);

  Future<Either<Failure, int>> getRealEstateAnnouncementCount(
      RealEstateParams params);
}
