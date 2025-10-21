part of 'estate_announcement_bloc.dart';

abstract class EstateAnnouncementEvent {}

class GetRealEstateAnnouncementEvent extends EstateAnnouncementEvent {
  final List<int> selectedCategories;
  final List<String> selectedRegions;
  final List<String> selectedSubRegions;
  final double maxPrice;
  final double minPrice;
  final String currency;
  final bool count;

  GetRealEstateAnnouncementEvent({
    this.selectedCategories = const [],
    this.selectedRegions = const [],
    this.selectedSubRegions = const [],
    this.maxPrice = 0.0,
    this.minPrice = 0.0,
    this.currency = 'uzs',
    this.count = false,
  });
}

class GetRealEstateAnnouncementCountEvent extends EstateAnnouncementEvent {
  final List<int> selectedCategories;
  final List<String> selectedRegions;
  final List<String> selectedSubRegions;
  final double maxPrice;
  final double minPrice;
  final String currency;
  final bool count;

  GetRealEstateAnnouncementCountEvent({
    this.selectedCategories = const [],
    this.selectedRegions = const [],
    this.selectedSubRegions = const [],
    this.maxPrice = 0.0,
    this.minPrice = 0.0,
    this.currency = 'uzs',
    this.count = true,
  });
}
