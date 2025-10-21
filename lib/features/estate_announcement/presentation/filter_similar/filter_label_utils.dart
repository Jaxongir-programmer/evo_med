
import 'package:flutter/cupertino.dart';

import '../../../common/domain/entity/location_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../blocs/filter/filter_controller_bloc.dart';

String buildCategoryLabel(BuildContext context, List<CategoryEntity> selectedCategories) {
  if (selectedCategories.isEmpty) return "Barcha ko'chmas mulk turlari";

  double screenWidth = MediaQuery.of(context).size.width;
  int approxCharLimit = (screenWidth / 10).floor(); // har 10px = 1 ta belgi deb hisoblaymiz

  String result = '';
  int remainingCount = 0;

  for (int i = 0; i < selectedCategories.length; i++) {
    final title = selectedCategories[i].title.titleByLocale;
    if ((result + title).length > approxCharLimit) {
      remainingCount = selectedCategories.length - i;
      break;
    }
    result += (result.isEmpty ? '' : ', ') + title;
  }

  if (remainingCount > 0) {
    result += '.. (+$remainingCount)';
  }

  return result;
}

String buildRegionLabel(BuildContext context, FilterControllerState state) {
  if (state.selectedSubRegions.isEmpty) return "Butun O'zbekiston";

  final screenWidth = MediaQuery.of(context).size.width;
  final maxLength = (screenWidth / 10).floor();

  // Subregionlarni regionlar bo‘yicha guruhlash: parentId -> count
  final grouped = <int, int>{};
  for (final sub in state.selectedSubRegions) {
    final parentId = sub.parentId ?? 0;
    grouped[parentId] = (grouped[parentId] ?? 0) + 1;
  }

  // Guruhlangan ma'lumotlarni "Toshkent (3)" ko‘rinishida tayyorlash
  final labels = grouped.entries.map((e) {
    final region = state.locations.firstWhere(
          (loc) => loc.id == e.key,
      orElse: () => LocationEntity(),
    );
    return "${region.title.titleByLocale} (${e.value})";
  }).toList();

  // Ekran uzunligiga qarab qisqartirish
  String result = '';
  for (final label in labels) {
    if ((result + (result.isEmpty ? '' : ', ') + label).length > maxLength) {
      result += '...';
      break;
    }
    result += (result.isEmpty ? '' : ', ') + label;
  }

  return result;
}

String buildSubRegionLabel(BuildContext context, List<LocationEntity> selectedCategories) {
  if (selectedCategories.isEmpty) return "Barcha ko'chmas mulk turlari";

  double screenWidth = MediaQuery.of(context).size.width;
  int approxCharLimit = (screenWidth / 10).floor(); // har 10px = 1 ta belgi deb hisoblaymiz

  String result = '';
  int remainingCount = 0;

  for (int i = 0; i < selectedCategories.length; i++) {
    final title = selectedCategories[i].title.titleByLocale;
    if ((result + title).length > approxCharLimit) {
      remainingCount = selectedCategories.length - i;
      break;
    }
    result += (result.isEmpty ? '' : ', ') + title;
  }

  if (remainingCount > 0) {
    result += '.. (+$remainingCount)';
  }

  return result;
}