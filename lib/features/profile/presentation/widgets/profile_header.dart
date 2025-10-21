import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/core/util/formatter.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_imageview.dart';
import 'package:evo_med/features/common/presentation/widgets/identification_status_widget.dart';
import 'package:evo_med/features/profile/presentation/blocs/profile/profile_bloc.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.containerBloc,
      padding: EdgeInsets.all(16),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Row(
            spacing: 16,
            children: [
              CustomImageView(
                imageUrl:
                    "https://lh3.googleusercontent.com/a/ACg8ocKP1O3VGd0Wk4Qc-lCWaVytLZGWWGT586EqEXtOinzCn5nl8ald=s576-c-no",
                width: 48,
                height: 48,
                borderRadius: BorderRadius.circular(24),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text("${state.profile.firstName} ${state.profile.lastName}", style: context.textTheme.displaySmall),
                  IdentificationStatusWidget(
                    isIdentified: state.profile.isIdentified,
                    textStyle: context.textTheme.bodyMedium,
                  ),
                  Text(
                    Formatters.phoneFormatter(mask: "+998 ## ### ## ##", initialText: state.profile.phone)
                        .getMaskedText(),
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.labelColor,
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
