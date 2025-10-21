import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/estate_announcement/presentation/filters/filter_estate_type_page.dart';
import 'package:evo_med/features/estate_announcement/presentation/filters/filter_region_page.dart';
import 'package:evo_med/features/estate_announcement/presentation/filters/main_filter_page.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.padding.bottom + context.viewInsets.bottom + 8,
        left: 16,
        right: 16,
      ),
      child: ExpandablePageView(
        controller: pageController,
        allowImplicitScrolling: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MainFilterPage(pageController: pageController),
          FilterEstateTypePage(pageController: pageController),
          FilterRegionPage(pageController: pageController),
          FilterSubRegionPage(pageController: pageController),
        ],
      ),
    );
  }
}
