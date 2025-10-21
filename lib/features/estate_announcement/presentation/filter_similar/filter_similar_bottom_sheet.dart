import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/features/estate_announcement/presentation/filter_similar/filter_similar_page.dart';

import 'filter_general_sub_pages.dart';

class FilterSimilarBottomSheet extends StatefulWidget {
  const FilterSimilarBottomSheet({super.key});

  @override
  State<FilterSimilarBottomSheet> createState() => _FilterSimilarBottomSheetState();
}

class _FilterSimilarBottomSheetState extends State<FilterSimilarBottomSheet> with SingleTickerProviderStateMixin {
  final PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
      controller: pageController,
      allowImplicitScrolling: true,
      animationDuration: Duration(milliseconds: 300),
      children: [
        FilterSimilarPage(pageController: pageController),
        FilterSimilarApartmentParamsPage(pageController:pageController),
        FilterSimilarSituationPage(pageController:pageController),
        FilterSimilarCommunicationPage(pageController:pageController),
        FilterSimilarBuildingMaterialPage(pageController:pageController),
      ],
    );
  }
}