import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/util/enums/enums.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/announce_item/announcement_item_widget.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/common/presentation/widgets/draft_announcement_item.dart';
import 'package:evo_med/features/profile/presentation/dialog/delete_announce_dialog.dart';
import 'package:evo_med/features/saved/presentation/pages/saved_screen.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class MyAnnouncementScreen extends StatefulWidget {
  const MyAnnouncementScreen({super.key});

  @override
  State<MyAnnouncementScreen> createState() => _MyAnnouncementScreenState();
}

class _MyAnnouncementScreenState extends State<MyAnnouncementScreen> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcons.chevronLeft.toSVGWidget(onTap: () {
          context.pop();
        }),
        title: Text(
          LocaleKeys.title_myAnnouncement.tr(),
          style: context.textTheme.displaySmall,
        ),
        toolbarHeight: 64,
        surfaceTintColor: AppColors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              padding: EdgeInsets.zero,
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: LocaleKeys.tab_active.tr(args: ["(2)"]),
                ),
                Tab(
                  text: LocaleKeys.tab_inModeration.tr(args: [""]),
                ),
                Tab(
                  text: LocaleKeys.tab_inactive.tr(args: [""]),
                ),
                Tab(
                  text: LocaleKeys.tab_draft.tr(args: [""]),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ListView(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  children: [
                    AnnouncementItemWidget.active(
                      imageList: [],
                      price: 120000000,
                      address: "Tashkent, Yunusabad, 2nd block",
                      roomNumbers: 4,
                      area: 150,
                      floor: 3,
                      totalFloor: 6,
                      saved: true,
                      difference: 5,
                      view: 1192,
                      onTap: () {},
                      activeDate: '12.12.2025',
                      onDelete: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DeleteAnnounceDialog();
                          },
                        );
                      },
                      onEdit: () {},
                      onPlayPause: () {},
                    )
                  ],
                ),
                ListView(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  children: [
                    AnnouncementItemWidget.moderation(
                      imageList: [],
                      price: 120000000,
                      address: "Tashkent, Yunusabad, 2nd block",
                      roomNumbers: 4,
                      area: 150,
                      floor: 3,
                      totalFloor: 6,
                      saved: true,
                      difference: 5,
                      view: 1192,
                      activeDate: '12.12.2025',
                      onTapAnnouncement: () {},
                      onTapCancelModeration: () {},
                      onTapChangeDetails: () {},
                      onTapDelete: () {},
                      onTapResentToModeration: () {},
                    ),
                    Gap(16),
                    AnnouncementItemWidget.moderation(
                      imageList: [],
                      price: 120000000,
                      address: "Tashkent, Yunusabad, 2nd block",
                      roomNumbers: 4,
                      area: 150,
                      floor: 3,
                      totalFloor: 6,
                      saved: true,
                      difference: 5,
                      view: 1192,
                      activeDate: '12.12.2025',
                      onTapAnnouncement: () {},
                      onTapCancelModeration: () {},
                      onTapChangeDetails: () {},
                      onTapDelete: () {},
                      onTapResentToModeration: () {},
                      status: AnnouncementStatus.inModerationCanceled,
                    )
                  ],
                ),
                ListView(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  children: [
                    AnnouncementItemWidget.inActive(
                      imageList: [],
                      price: 120000000,
                      address: "Tashkent, Yunusabad, 2nd block",
                      roomNumbers: 4,
                      area: 150,
                      floor: 3,
                      totalFloor: 6,
                      saved: true,
                      difference: 5,
                      view: 1192,
                      activeDate: '12.12.2025',
                      onTapDelete: () {},
                      onTapAnnouncement: () {},
                      onTapActive: () {},
                      onTapChangeDetails: () {},
                    )
                  ],
                ),
                ListView(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  children: [
                    DraftAnnouncementItem(
                      onTap: () {},
                      onDelete: () {},
                      onContinue: () {},
                      draftInfo: "Toshkent shaxri, Yashnobod tumani, Buyuk turon ko’chasi, 33-uy 4-xonadon....",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomButton(
        onTap: () {
          context.pushNamed(AppRouter.addAnnouncement);
        },
        text: LocaleKeys.btn_addAnnouncement.tr(),
        margin: EdgeInsets.only(
          bottom: context.padding.bottom + 16,
          left: 16,
          right: 16,
        ),
      ),
    );
  }
}
