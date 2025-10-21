import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/profile/domain/entities/tariff_entity.dart';
import 'package:evo_med/features/profile/presentation/blocs/packages/packages_bloc.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class AddAnnouncementTab extends StatelessWidget {
  const AddAnnouncementTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: context.padding.bottom, top: 16),
      children: [
        Text(
          LocaleKeys.title_addAnnouncementPrice.tr(),
          style: context.textTheme.displaySmall,
        ),
        Gap(16),
        BlocBuilder<PackagesBloc, PackagesState>(
          builder: (context, state) {
            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = state.postTariffs[index];
                return ListTileWidget(
                  item: item,
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) => Divider(height: 0),
              itemCount: state.postTariffs.length,
            );
          },
        ),
        Gap(32),
        Text(
          LocaleKeys.title_upToTop.tr(),
          style: context.textTheme.displaySmall,
        ),
        Gap(8),
        Text(
          LocaleKeys.label_upToTopDesc.tr(),
          style: context.textTheme.bodyMedium!.copyWith(color: AppColors.labelColor),
        ),
        Gap(16),
        BlocBuilder<PackagesBloc, PackagesState>(
          builder: (context, state) {
            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = state.topTariffs[index];
                return ListTileWidget(
                  item: item,
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) => Divider(height: 0),
              itemCount: state.topTariffs.length,
            );
          },
        ),
      ],
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.item,
    required this.onTap,
  });

  final Function() onTap;
  final TariffEntity item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 48,
        alignment: Alignment.centerLeft,
        child: Text(
          LocaleKeys.label_sumPerDay.tr(
            args: [item.limit.toString(), item.price.priceFormat()],
          ),
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
