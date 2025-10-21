part of 'filter_controller_bloc.dart';

sealed class FilterControllerEvent {
  const FilterControllerEvent();
}

class GetCategoriesEvent extends FilterControllerEvent {
  final int parentId;
  const GetCategoriesEvent({this.parentId = 0});
}

class SetSelectedCategoriesEvent extends FilterControllerEvent {
  final List<CategoryEntity> selectedCategories;
  const SetSelectedCategoriesEvent({required this.selectedCategories});
}

class GetRegionsEvent extends FilterControllerEvent {
  final int parentId;

  const GetRegionsEvent({this.parentId = 0});
}

class AddSubRegionEvent extends FilterControllerEvent {
  final LocationEntity subRegion;
  AddSubRegionEvent({required this.subRegion});
}

class RemoveSubRegionEvent extends FilterControllerEvent {
  final LocationEntity subRegion;
  RemoveSubRegionEvent({required this.subRegion});
}

class ClearFiltersEvent extends FilterControllerEvent {}

class SetPriceRangeEvent extends FilterControllerEvent {
  final double min;
  final double max;

  const SetPriceRangeEvent({required this.min, required this.max});
}

class SetCurrencyEvent extends FilterControllerEvent {
  final String currency;

  const SetCurrencyEvent({required this.currency});
}

class GetAttributesEvent extends FilterControllerEvent {
  final int categoryId;

  const GetAttributesEvent({required this.categoryId});
}