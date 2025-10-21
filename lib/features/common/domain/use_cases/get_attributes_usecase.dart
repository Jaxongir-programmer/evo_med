import 'package:evo_med/core/error/failure_handler.dart';
import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/util/either.dart';
import 'package:evo_med/core/util/params/common_params.dart';
import 'package:evo_med/features/common/domain/entity/attribute_entity.dart';
import 'package:evo_med/features/common/domain/entity/location_entity.dart';
import 'package:evo_med/features/common/domain/repository/common_repository.dart';

class GetAttributesUseCase extends UseCase<List<AttributeEntity>, AttributeParams> {
  final CommonRepository repository;

  GetAttributesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<AttributeEntity>>> call(AttributeParams params) async {
    return await repository.getAttributes(params);
  }
}
