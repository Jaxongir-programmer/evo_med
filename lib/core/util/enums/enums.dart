import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/core/config/app_icons.dart';

/// Enum for pop up status
enum PopUpStatus {
  failure(AppIcons.failure),
  success(AppIcons.success),
  warning(AppIcons.warning);

  final String icon;

  const PopUpStatus(this.icon);

  bool get isFailure => this == PopUpStatus.failure;

  bool get isSuccess => this == PopUpStatus.success;

  bool get isWarning => this == PopUpStatus.warning;
}

enum SuccessType {
  register,
  identification,
  moderation,
  newPassword;

  bool get isRegister => this == SuccessType.register;

  bool get isModeration => this == SuccessType.moderation;

  bool get isNewPassword => this == SuccessType.newPassword;

  bool get isIdentification => this == SuccessType.identification;
}

enum EstateType {
  apartment,
  individualHouse,
  unsettledHouse,
  emptyLand,
  otherLand;

  bool get isApartment => this == EstateType.apartment;

  bool get isIndividualHouse => this == EstateType.individualHouse;

  bool get isUnsettledHouse => this == EstateType.unsettledHouse;

  bool get isEmptyLand => this == EstateType.emptyLand;

  bool get isOtherLand => this == EstateType.otherLand;
}

enum AnnouncementStatus {
  initial,
  active,
  inModeration,
  inModerationCanceled,
  inActive,
  draft;

  bool get isInitial => this == AnnouncementStatus.initial;

  bool get isActive => this == AnnouncementStatus.active;

  bool get isInModeration => this == AnnouncementStatus.inModeration;

  bool get isInModerationCanceled => this == AnnouncementStatus.inModerationCanceled;

  bool get isInActive => this == AnnouncementStatus.inActive;

  bool get isDraft => this == AnnouncementStatus.draft;
}

enum PaymentHistoryType {
  income,
  expense,
  reserve;

  bool get isIncome => this == PaymentHistoryType.income;

  bool get isExpense => this == PaymentHistoryType.expense;

  bool get isReserve => this == PaymentHistoryType.reserve;
}

enum AnnouncementType {
  estate("estate"),
  car("car");

  final String name;

  const AnnouncementType(this.name);
}

enum OrderType {
  asc("ASC"),
  desc("DESC"),
  none("NONE");

  final String name;

  const OrderType(this.name);

  bool get isAsc => this == OrderType.asc;

  bool get isDesc => this == OrderType.desc;

  bool get isNone => this == OrderType.none;
}

enum FilterValueType{
  @JsonValue("number") NUMBER,
  @JsonValue("text") TEXT,
  @JsonValue("checkbox") CHECKBOX,
}

