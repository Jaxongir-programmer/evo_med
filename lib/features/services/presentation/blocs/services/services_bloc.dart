import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart'; 
import 'package:evo_med/features/services/domain/entities/services_entity.dart';
import 'package:evo_med/features/services/domain/use_cases/services_usecase.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServicesUseCase servicesUseCase;
        
  ServicesBloc({required this.servicesUseCase}) : super(const ServicesState()) {
    on<ServicesGetEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await servicesUseCase('');
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          services: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
  }
}
    