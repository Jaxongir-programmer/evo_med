import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/profile/presentation/blocs/packages/packages_bloc.dart';
import 'package:evo_med/features/profile/presentation/pages/packages/widget/no_package_widget.dart';
import 'package:evo_med/features/profile/presentation/pages/packages/widget/package_status_widget.dart';
import 'package:evo_med/features/profile/presentation/widgets/non_package_price_widget.dart';
import 'package:evo_med/features/profile/presentation/widgets/tariff_item_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class SeeAnnouncementTab extends StatelessWidget {
  const SeeAnnouncementTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesBloc, PackagesState>(
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: context.padding.bottom + 32,
            top: 16,
          ),
          children: [
            if (state.userTariffs.isNotEmpty)
              PackageStatusWidget(
                allLimit: state.userTariffs.first.limit,
                availableLimit: state.userTariffs.first.remaining,
                tariffName: state.userTariffs.first.tariff.title,
                validityPeriod: state.userTariffs.first.validityDate,
              ),
            Gap(12),
            Text(LocaleKeys.title_packages.tr(), style: context.textTheme.displaySmall),
            if (state.userTariffs.isEmpty) ...[
              Gap(8),
              NoPackageTitle(),
            ],
            if (state.userTariffs.isNotEmpty && state.userTariffs.first.remaining != 0) ...[
              Container(
                decoration: BoxDecoration(
                  color: AppColors.containerBloc,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(12),
                child: Text(
                  LocaleKeys.title_contactedAnnouncements.tr(),
                  style: context.textTheme.labelMedium,
                ),
              ),
              Gap(4)
            ] else
              Gap(12),
            BlocBuilder<PackagesBloc, PackagesState>(
              builder: (context, state) {
                return ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = state.viewTariffs[index];
                    return TariffItemWidget(
                      name: LocaleKeys.title_packageType.tr(args: [item.title]),
                      price: item.price,
                      id: item.id,
                      description: LocaleKeys.label_seeContactInfo.tr(args: [item.limit.priceFormat()]),
                      onTap: () {},
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(8);
                  },
                  itemCount: state.viewTariffs.length,
                );
              },
            ),
            Gap(8),
            NonPackagePriceWidget(
              nonTariffPrice: 1000,
            )
          ],
        );
      },
    );
  }
}
