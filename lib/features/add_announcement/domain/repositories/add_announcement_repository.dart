import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/add_announcement/domain/entities/add_announcement_entity.dart';

abstract class AddAnnouncementRepository {
  Future<Either<Failure, AddAnnouncementEntity>> getAddAnnouncement(String params);
}
    