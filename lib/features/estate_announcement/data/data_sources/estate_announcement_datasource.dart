import 'package:evo_med/core/util/params/real_estate_params.dart';
import 'package:evo_med/features/common/data/models/generic_pagination.dart';
import 'package:evo_med/features/estate_announcement/data/models/estate_announcement_card_model.dart';

abstract class EstateAnnouncementDataSource {
  Future<PaginationList<EstateAnnouncementCardModel>> getRealEstateAnnouncement(RealEstateParams params);

  Future<int> getRealEstateAnnouncementCount(RealEstateParams params);
}
