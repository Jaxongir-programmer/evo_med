import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/repository/repository_utils.dart';
import 'package:evo_med/features/add_announcement/data/data_sources/add_announcement_datasource.dart';
import 'package:evo_med/features/add_announcement/domain/entities/add_announcement_entity.dart';
import 'package:evo_med/features/add_announcement/domain/repositories/add_announcement_repository.dart';


class AddAnnouncementRepositoryImpl with RepositoryUtil implements AddAnnouncementRepository {
    final AddAnnouncementDataSource addAnnouncementDataSource;
  
    AddAnnouncementRepositoryImpl({required this.addAnnouncementDataSource});
  
    @override
    Future<Either<Failure, AddAnnouncementEntity>> getAddAnnouncement(params) {
      return callSafely(() async {
        var result = await addAnnouncementDataSource.getAddAnnouncement(params);
        return result.toEntity();
      });
    }
}
    