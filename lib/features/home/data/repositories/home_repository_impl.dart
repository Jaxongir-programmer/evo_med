import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/repository/repository_utils.dart';
import 'package:evo_med/features/home/data/data_sources/home_datasource.dart';
import 'package:evo_med/features/home/domain/entities/home_statistic_entity.dart';
import 'package:evo_med/features/home/domain/entities/message_entity.dart';
import 'package:evo_med/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl with RepositoryUtil implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<Either<Failure, HomeStatisticEntity>> getHomeStatistics() {
    return callSafely(() async {
      var result = await homeDataSource.getHomeStatistics();
      return result.toEntity();
    });
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getMessages() {
    return callSafely(() async {
      var result = await homeDataSource.getMessages();
      return result.map((e) => e.toEntity()).toList();
    });
  }
}
