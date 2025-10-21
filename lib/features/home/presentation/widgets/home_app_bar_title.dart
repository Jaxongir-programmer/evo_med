import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/identification_status_widget.dart';
import 'package:evo_med/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

import '../../../../core/config/app_icons.dart';

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (state.profile.isIdentified) {
              return;
            } else if (state.profile.id == 0) {
              context.pushNamed(AppRouter.login);
            } else {
              // context.pushNamed(AppRouter.profile);
            }
          },
          behavior: HitTestBehavior.opaque,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(8),
              AppIcons.user.toSVGWidget(size: 48),
              if (state.profile.id == 0)
                Text(
                  LocaleKeys.title_login.tr(),
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${state.profile.firstName} ${state.profile.lastName}',
                      style: context.textTheme.displaySmall!.copyWith(
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    IdentificationStatusWidget(isIdentified: state.profile.isIdentified),
                  ],
                )
            ],
          ),
        );
      },
    );
  }
}
