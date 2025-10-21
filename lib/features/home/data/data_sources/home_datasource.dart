import 'package:evo_med/features/home/data/models/home_statistic_model.dart';
import 'package:evo_med/features/home/data/models/message_model.dart';

abstract class HomeDataSource {
  Future<HomeStatisticModel> getHomeStatistics();

  Future<List<MessageModel>> getMessages();
}
