import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart'; 
import 'package:evo_med/features/estate_detail/domain/entities/estate_detail_entity.dart';
import 'package:evo_med/features/estate_detail/domain/use_cases/estate_detail_usecase.dart';

part 'estate_detail_event.dart';
part 'estate_detail_state.dart';

class EstateDetailBloc extends Bloc<EstateDetailEvent, EstateDetailState> {
  final EstateDetailUseCase estateDetailUseCase;
        
  EstateDetailBloc({required this.estateDetailUseCase}) : super(const EstateDetailState()) {
    on<EstateDetailGetEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await estateDetailUseCase('');
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          estateDetail: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
  }
}
    