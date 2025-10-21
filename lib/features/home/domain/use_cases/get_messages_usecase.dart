import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/features/home/domain/entities/message_entity.dart';
import 'package:evo_med/features/home/domain/repositories/home_repository.dart';
import 'package:evo_med/features/home/domain/entities/home_statistic_entity.dart';

class GetMessagesUseCase implements UseCase<List<MessageEntity>, NoParams> {
  final HomeRepository homeRepository;

  GetMessagesUseCase({
    required this.homeRepository,
  });

  @override
  Future<Either<Failure, List<MessageEntity>>> call(NoParams params) async {
    return await homeRepository.getMessages();
  }
}
