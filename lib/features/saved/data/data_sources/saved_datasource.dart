import 'package:evo_med/core/util/params/saved_params.dart';
import 'package:evo_med/features/estate_announcement/data/models/estate_announcement_card_model.dart';

abstract class SavedDataSource {
  Future<EstateAnnouncementCardModel> addToSaved(SavedParams params);

  Future<void> deleteSaved(SavedParams params);

  Future<void> updateSaved(SavedParams params);

  Future<List<EstateAnnouncementCardModel>> getSavedList(SavedParams params);
}
