import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:evo_med/core/usecases/base_usecase.dart';
import 'package:evo_med/features/home/domain/entities/home_statistic_entity.dart';
import 'package:evo_med/features/home/domain/use_cases/get_home_services_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeServicesUseCase getHomeInfoUseCase;

  HomeBloc({required this.getHomeInfoUseCase}) : super(const HomeState()) {
    on<GetHomeServicesEvent>((event, emit) async {
      emit(state.copyWith(getHomeServiceInfoStatus: FormzSubmissionStatus.inProgress));
      final result = await getHomeInfoUseCase(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          getHomeServiceInfoStatus: FormzSubmissionStatus.success,
          homeStatisticEntity: result.right,
        ));
      } else {
        emit(state.copyWith(getHomeServiceInfoStatus: FormzSubmissionStatus.failure));
      }
    });
  }
}
