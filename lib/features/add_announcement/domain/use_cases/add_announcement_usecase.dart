import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/add_announcement/domain/repositories/add_announcement_repository.dart';
import 'package:evo_med/features/add_announcement/domain/entities/add_announcement_entity.dart';

class AddAnnouncementUseCase implements UseCase<AddAnnouncementEntity, String> {
  final AddAnnouncementRepository addAnnouncementRepository;
  AddAnnouncementUseCase({
    required this.addAnnouncementRepository,
  });

  @override
  Future<Either<Failure, AddAnnouncementEntity>> call(String params) async {
    return await addAnnouncementRepository.getAddAnnouncement(params);
  }
}
    