import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/core/util/params/profile_params.dart';
import 'package:evo_med/features/profile/domain/entities/tariff_entity.dart';
import 'package:evo_med/features/profile/domain/entities/user_tariff_entity.dart';
import 'package:evo_med/features/profile/domain/use_cases/buy_tariff_usecase.dart';
import 'package:evo_med/features/profile/domain/use_cases/get_tariffs_usecase.dart';
import 'package:evo_med/features/profile/domain/use_cases/user_tariffs_usecase.dart';

part 'packages_event.dart';

part 'packages_state.dart';

class PackagesBloc extends Bloc<PackagesEvent, PackagesState> {
  final GetTariffsUseCase getTariffsUseCase;
  final BuyTariffUseCase buyTariffUseCase;
  final GetUserTariffsUseCase getUserTariffsUseCase;

  PackagesBloc({
    required this.getTariffsUseCase,
    required this.buyTariffUseCase,
    required this.getUserTariffsUseCase,
  }) : super(PackagesState()) {
    on<GetPackagesEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await getTariffsUseCase(TariffParams());
      if (result.isRight) {
        final viewTariffs = result.right.where((element) => element.type == 'view').toList();
        final postTariffs = result.right.where((element) => element.type == 'post').toList();
        final topTariffs = result.right.where((element) => element.type == 'top').toList();

        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          viewTariffs: viewTariffs,
          postTariffs: postTariffs,
          topTariffs: topTariffs,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
    on<BuyPackageEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await buyTariffUseCase(TariffParams(id: event.tariffId));
      if (result.isRight) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
    on<GetUserPackagesEvent>((event, emit) async {
      final result = await getUserTariffsUseCase(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          userTariffs: result.right,
        ));
      }
    });
  }
}
