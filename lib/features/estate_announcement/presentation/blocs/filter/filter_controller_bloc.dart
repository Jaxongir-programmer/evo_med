import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:evo_med/core/util/params/common_params.dart';
import 'package:evo_med/features/common/domain/entity/attribute_entity.dart';
import 'package:evo_med/features/common/domain/use_cases/get_attributes_usecase.dart';
import 'package:evo_med/features/common/domain/use_cases/get_categories_usecase.dart';
import 'package:evo_med/features/common/domain/use_cases/get_locations_usecase.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/category_entity.dart';

import '../../../../common/domain/entity/location_entity.dart';

part 'filter_controller_event.dart';

part 'filter_controller_state.dart';

class FilterControllerBloc extends Bloc<FilterControllerEvent, FilterControllerState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetLocationsUseCase getLocationsUseCase;
  final GetAttributesUseCase getAttributesUseCase;

  FilterControllerBloc({
    required this.getCategoriesUseCase,
    required this.getLocationsUseCase,
    required this.getAttributesUseCase,
  }) : super(FilterControllerState()) {
    on<GetCategoriesEvent>(
      (event, emit) async {
        emit(state.copyWith(
          categoriesStatus: FormzSubmissionStatus.inProgress,
        ));
        final categories = await getCategoriesUseCase(CategoriesParams(parentId: event.parentId));
        if (categories.isRight) {
          emit(state.copyWith(
            categories: categories.right,
            categoriesStatus: FormzSubmissionStatus.success,
          ));
        } else {
          emit(state.copyWith(
            categoriesStatus: FormzSubmissionStatus.failure,
          ));
        }
      },
    );

    on<SetSelectedCategoriesEvent>(
      (event, emit) {
        emit(state.copyWith(selectedCategories: [...event.selectedCategories]));
      },
    );

    on<GetRegionsEvent>(
      (event, emit) async {
        emit(state.copyWith(
          locationsStatus: FormzSubmissionStatus.inProgress,
        ));
        final locations = await getLocationsUseCase(LocationsParams(parentId: event.parentId));
        if (locations.isRight) {
          final updatedState =
              event.parentId == 0 ? state.copyWith(locations: locations.right) : state.copyWith(subRegions: locations.right);

          emit(updatedState.copyWith(currentParentId: event.parentId, locationsStatus: FormzSubmissionStatus.success));
        } else {
          emit(state.copyWith(
            locationsStatus: FormzSubmissionStatus.failure,
          ));
        }
      },
    );

    on<AddSubRegionEvent>((event, emit) {
      final updated = List<LocationEntity>.from(state.selectedSubRegions)..add(event.subRegion);
      emit(state.copyWith(selectedSubRegions: updated));
    });

    on<RemoveSubRegionEvent>((event, emit) {
      final updated = List<LocationEntity>.from(state.selectedSubRegions)..removeWhere((e) => e.id == event.subRegion.id);
      emit(state.copyWith(selectedSubRegions: updated));
    });

    on<ClearFiltersEvent>((event, emit) {
      emit(state.copyWith(selectedCategories: [], selectedSubRegions: []));
    });

    on<SetPriceRangeEvent>((event, emit) {
      emit(state.copyWith(
        minPrice: event.min,
        maxPrice: event.max,
      ));
    });

    on<SetCurrencyEvent>((event, emit) {
      emit(state.copyWith(currency: event.currency));
    });

    on<GetAttributesEvent>(
      (event, emit) async {
        emit(state.copyWith(
          attributesStatus: FormzSubmissionStatus.inProgress,
        ));
        final attributes = await getAttributesUseCase(AttributeParams(categoryId: event.categoryId));
        if (attributes.isRight) {
          emit(state.copyWith(
            attributes: attributes.right,
            attributesStatus: FormzSubmissionStatus.success,
          ));
        } else {
          emit(state.copyWith(
            attributesStatus: FormzSubmissionStatus.failure,
          ));
        }
      },
    );
  }
}
