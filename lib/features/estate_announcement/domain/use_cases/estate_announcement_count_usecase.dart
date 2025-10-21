
import '../../../../core/error/failure_handler.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../../../core/util/either.dart';
import '../../../../core/util/params/real_estate_params.dart';
import '../repositories/estate_announcement_repository.dart';

class GetRealEstateAnnouncementCountUseCase implements UseCase<int, RealEstateParams> {
  final EstateAnnouncementRepository estateAnnouncementRepository;

  GetRealEstateAnnouncementCountUseCase({
    required this.estateAnnouncementRepository,
  });

  @override
  Future<Either<Failure, int>> call(RealEstateParams params) async {
    return await estateAnnouncementRepository.getRealEstateAnnouncementCount(params);
  }
}
