import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/home/domain/entities/home_statistic_entity.dart';
import 'package:evo_med/features/home/domain/entities/message_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeStatisticEntity>> getHomeStatistics();

  Future<Either<Failure, List<MessageEntity>>> getMessages();
}
