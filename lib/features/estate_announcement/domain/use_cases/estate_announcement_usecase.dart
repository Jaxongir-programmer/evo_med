import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/real_estate_params.dart';
import 'package:evo_med/features/common/data/models/generic_pagination.dart';
import 'package:evo_med/features/estate_announcement/domain/repositories/estate_announcement_repository.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/estate_announcement_card_entity.dart';

class GetRealEstateAnnouncementUseCase implements UseCase<PaginationList<EstateAnnouncementCardEntity>, RealEstateParams> {
  final EstateAnnouncementRepository estateAnnouncementRepository;
  GetRealEstateAnnouncementUseCase({
    required this.estateAnnouncementRepository,
  });

  @override
  Future<Either<Failure, PaginationList<EstateAnnouncementCardEntity>>> call(RealEstateParams params) async {
    return await estateAnnouncementRepository.getRealEstateAnnouncement(params);
  }
}