part of 'filter_controller_bloc.dart';

class FilterControllerState extends Equatable {
  const FilterControllerState({
    this.categories = const [],
    this.selectedCategories = const [],
    this.locations = const [],
    this.subRegions = const [],
    this.categoriesStatus = FormzSubmissionStatus.initial,
    this.locationsStatus = FormzSubmissionStatus.initial,
    this.selectedSubRegions = const [],
    this.currentParentId = 0,
    this.minPrice = 0.0,
    this.maxPrice = 0.0,
    this.currency = 'uzs',
    this.attributes = const [],
    this.attributesStatus = FormzSubmissionStatus.initial,
  });

  final FormzSubmissionStatus categoriesStatus;
  final List<CategoryEntity> categories;
  final List<CategoryEntity> selectedCategories;
  final List<LocationEntity> locations;
  final List<LocationEntity> subRegions;
  final FormzSubmissionStatus locationsStatus;
  final List<LocationEntity> selectedSubRegions;
  final int? currentParentId;
  final double minPrice;
  final double maxPrice;
  final String currency;
  final List<AttributeEntity> attributes;
  final FormzSubmissionStatus attributesStatus;

  FilterControllerState copyWith({
    List<CategoryEntity>? categories,
    List<CategoryEntity>? selectedCategories,
    FormzSubmissionStatus? categoriesStatus,
    List<LocationEntity>? locations,
    List<LocationEntity>? subRegions,
    FormzSubmissionStatus? locationsStatus,
    List<LocationEntity>? selectedSubRegions,
    int? currentParentId,
    double? minPrice,
    double? maxPrice,
    String? currency,
    List<AttributeEntity>? attributes,
    FormzSubmissionStatus? attributesStatus,
  }) {
    return FilterControllerState(
      categories: categories ?? this.categories,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      locations: locations ?? this.locations,
      subRegions: subRegions ?? this.subRegions,
      locationsStatus: locationsStatus ?? this.locationsStatus,
      selectedSubRegions: selectedSubRegions ?? this.selectedSubRegions,
      currentParentId: currentParentId ?? this.currentParentId,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      currency: currency ?? this.currency,
      attributes: attributes ?? this.attributes,
      attributesStatus: attributesStatus ?? this.attributesStatus,
    );
  }

  @override
  List<Object?> get props => [
        categories,
        categoriesStatus,
        selectedCategories,
        locations,
        locationsStatus,
        subRegions,
        selectedSubRegions,
        currentParentId,
        minPrice,
        maxPrice,
        currency,
        attributes,
        attributesStatus,
      ];
}
