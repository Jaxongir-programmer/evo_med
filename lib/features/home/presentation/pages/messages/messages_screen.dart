import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/service_locator.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/home/presentation/blocs/messages/messages_bloc.dart';
import 'package:evo_med/features/home/presentation/widgets/message_item_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late final MessagesBloc messagesBloc;

  @override
  void initState() {
    messagesBloc = MessagesBloc(getMessagesUseCase: serviceLocator())..add(GetMessagesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: messagesBloc,
      child: Scaffold(
        appBar: AppBar(
          leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
            context.pop();
          }),
          title: Text(
            LocaleKeys.title_messages.tr(),
            style: context.textTheme.displaySmall,
          ),
          toolbarHeight: 64,
          surfaceTintColor: AppColors.white,
        ),
        body: BlocBuilder<MessagesBloc, MessagesState>(
          builder: (context, state) {
            return ListView.separated(
              padding: EdgeInsets.all(16),
              itemBuilder: (BuildContext context, int index) {
                final itemEntity = state.messages[index];
                return MessageItemWidget(
                  title: itemEntity.title,
                  label: itemEntity.formattedDate,
                  onTap: () {
                    context.pushNamed(AppRouter.messagesDetail);
                  },
                  isRead: itemEntity.isPublished,
                );
              },
              separatorBuilder: (BuildContext context, int index) => Gap(8),
              itemCount: state.messages.length,
            );
          },
        ),
      ),
    );
  }
}
