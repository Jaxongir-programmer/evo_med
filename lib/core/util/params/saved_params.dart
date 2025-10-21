import 'package:evo_med/core/util/enums/enums.dart';

class SavedParams {
  final AnnouncementType type;
  final int announcementId;
  final String title;
  final Map<String, dynamic> filter;
  final bool autoNotify;

  const SavedParams({
    this.type = AnnouncementType.estate,
    this.announcementId = -1,
    this.title = '',
    this.filter = const {},
    this.autoNotify = false,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'type': type.name.toString(),
    };
    if (announcementId != -1) {
      json['announcement_id'] = announcementId;
    }
    if (title.isNotEmpty) {
      json['title'] = title;
    }
    if (filter.isNotEmpty) {
      json['filter'] = filter;
    }
    if (autoNotify) {
      json['auto_notify'] = autoNotify;
    }
    return json;
  }
}
