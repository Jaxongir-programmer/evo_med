import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/drag_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/image_preloader.dart';
import 'package:evo_med/features/common/presentation/widgets/list_tile_with_checkbox.dart';
import 'package:evo_med/features/common/presentation/widgets/shimmer_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/title_modal_widget.dart';
import 'package:evo_med/features/estate_announcement/domain/entities/category_entity.dart';
import 'package:evo_med/features/estate_announcement/presentation/blocs/filter/filter_controller_bloc.dart';
import 'package:evo_med/generated/locale_keys.g.dart';
import 'package:nirikshak/utils/nirikshak_extension.dart';
import 'package:shimmer/shimmer.dart';

class FilterEstateTypePage extends StatefulWidget {
  const FilterEstateTypePage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<FilterEstateTypePage> createState() => _FilterEstateTypePageState();
}

class _FilterEstateTypePageState extends State<FilterEstateTypePage> {
  List<CategoryEntity> _selectedCategories = [];

  @override
  void initState() {
    super.initState();
    context.read<FilterControllerBloc>().add(
          GetCategoriesEvent(
            parentId: 0,
          ),
        );
    _selectedCategories = [...context.read<FilterControllerBloc>().state.selectedCategories];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedCategories = [...context.read<FilterControllerBloc>().state.selectedCategories];
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    print("estate");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DragWidget(),
        TitleModalWidget(
          title: LocaleKeys.title_estateType.tr(),
          onCloseTap: () {
            context.pop();
          },
        ),
        Container(
          constraints: BoxConstraints(maxHeight: context.sizeOf.height * .65),
          child: BlocBuilder<FilterControllerBloc, FilterControllerState>(
            builder: (context, state) {
              if (state.categoriesStatus.isSuccess) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return ListTileWithCheckBox(
                      title: category.title.titleByLocale,
                      isChecked: _selectedCategories.contains(category),
                      checkboxChanged: (value) {
                        if (value) {
                          _selectedCategories.add(category);
                        } else {
                          _selectedCategories.remove(category);
                        }
                        setState(() {});
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(height: 0);
                  },
                  itemCount: state.categories.length,
                );
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: ShimmerWidget(
                        height: 22,
                        width: Random().nextInt(200).clamp(40, 100).toDouble(),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(height: 0);
                  },
                  itemCount: 6,
                );
              }
            },
          ),
        ),
        Gap(16),
        Row(
          spacing: 16,
          children: [
            CustomButton.light(
              text: LocaleKeys.btn_back.tr(),
              onTap: () {

                _selectedCategories = [...context.read<FilterControllerBloc>().state.selectedCategories];
                setState(() {});
                widget.pageController.jumpToPage(0);
              },
            ),
            BlocListener<FilterControllerBloc, FilterControllerState>(
              listener: (context, state) {
                //
              },
              child: CustomButton(
                isExpanded: true,
                text: LocaleKeys.btn_confirm.tr(args: [""]),
                onTap: () async {
                  widget.pageController.jumpToPage(0);
                  context.read<FilterControllerBloc>().add(SetSelectedCategoriesEvent(selectedCategories: _selectedCategories));
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
