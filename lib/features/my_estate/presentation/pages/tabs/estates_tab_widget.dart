import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/features/estate_detail/presentation/dialog/charge_bottom_sheet.dart';
import 'package:evo_med/features/my_estate/presentation/widgets/estate_item_widget.dart';
import 'package:evo_med/features/my_estate/presentation/widgets/identify_widget.dart';
import 'package:evo_med/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class EstatesTabWidget extends StatelessWidget {
  const EstatesTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.profile.isIdentified) {
          return ListView(
            children: [
              EstateItemWidget(),
              Gap(16),
              EstateItemWidget(forRegion: true),
              // EmptyEstateWidget(icon: AppIcons.noEstate, label: LocaleKeys.label_estateInfoNotFound),
            ],
          );
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IdentifyWidget(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    builder: (context) {
                      return ChargeBottomSheet(
                        chargeAmount: "22 500",
                      );
                    },
                  );
                },
                icon: AppIcons.estateIden,
                buttonText: LocaleKeys.btn_downloadEstate.tr(),
                price: "22 500 UZS",
              ),
            ],
          );
        }
      },
    );
  }
}
