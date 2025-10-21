import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/config/app_icons.dart';
import 'package:evo_med/core/config/app_images.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/announce_item/announcement_item_widget.dart';
import 'package:evo_med/features/saved/presentation/blocs/saved/saved_bloc.dart';
import 'package:evo_med/features/saved/presentation/widgets/saved_search_item_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
          LocaleKeys.title_savedAddAndSearch.tr(),
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
              controller: tabController,
              tabs: [
                Tab(
                  text: LocaleKeys.tab_announcement.tr(),
                ),
                Tab(
                  text: LocaleKeys.tab_search.tr(),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // Announcement
                BlocBuilder<SavedBloc, SavedState>(
                  builder: (context, state) {
                    return ListView.separated(
                      padding: EdgeInsets.all(16),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final estateItem = state.savedAnnouncementsList[index];
                        return AnnouncementItemWidget(
                          announcementId: estateItem.id,
                          imageList: estateItem.images,     //estateItem.images.main
                          price: estateItem.price.uzs,
                          address: estateItem.address.fullAddress,
                          roomNumbers: estateItem.roomCount,
                          area: estateItem.area,
                          floor: estateItem.floor,
                          totalFloor: estateItem.floorCount,
                          difference: 0,
                          activeDate: "" ,
                          saved: estateItem.isFavorite,
                          view: estateItem.views,
                          onTap: () {
                            // context.pushNamed(AppRouter.estateDetail, extra: EstateType.apartment);
                            // context.pushNamed(AppRouter.estateAnnounceDetail, extra: EstateType.otherLand);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => Gap(14),
                      itemCount: state.savedAnnouncementsList.length,
                    );
                  },
                ),
                // Search
                ListView(
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    SavedSearchItemWidget(
                      title: "Olmaliq kvartira",
                      body:
                          'Toshkent viloyati, \nOlmaliq shaxri \n0 dan 300 000 000 so’m \nNovostroyka \n2 dan 4 xonagacha \n0 dan 72 kv m2 gacha \n4 dan 5 qavatgacha \nOlmazor metroga yaqin \nMebelsiz \nRemonti yaxshi',
                      hasResult: true,
                    ),
                    Gap(16),
                    SavedSearchItemWidget(
                      title: "Olmaliq kvartira",
                      body:
                          'Toshkent viloyati, \nOlmaliq shaxri \n0 dan 300 000 000 so’m \nNovostroyka \n2 dan 4 xonagacha \n0 dan 72 kv m2 gacha \n4 dan 5 qavatgacha \nOlmazor metroga yaqin \nMebelsiz \nRemonti yaxshi',
                      hasResult: false,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
